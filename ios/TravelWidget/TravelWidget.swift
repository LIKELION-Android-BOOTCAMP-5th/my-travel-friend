//
//  TravelWidget.swift
//  TravelWidget
//
//  Created by Shiny Lee on 12/31/25.
//

import WidgetKit
import SwiftUI

// MARK: - Data Manager
class WidgetDataManager {
    static let shared = WidgetDataManager()
    private let suiteName = "group.com.team1113.mytravelfriend"
    
    private var userDefaults: UserDefaults? {
        UserDefaults(suiteName: suiteName)
    }
    
    func getDDayData() -> DDayData {
        guard let defaults = userDefaults else {
            return DDayData.placeholder
        }
        let tripId = defaults.integer(forKey: "dday_trip_id")
        let tripTitle = defaults.string(forKey: "dday_trip_title") ?? "여행을 선택하세요"
        let dDayText = defaults.string(forKey: "dday_text") ?? "D-?"
        return DDayData(tripId: tripId, tripTitle: tripTitle, dDayText: dDayText)
    }
    
    func getScheduleData() -> ScheduleData {
        guard let defaults = userDefaults else {
            return ScheduleData.placeholder
        }
        let tripId = defaults.integer(forKey: "schedule_trip_id")
        let tripTitle = defaults.string(forKey: "schedule_trip_title") ?? "오늘의 일정"
        let scheduleDate = defaults.string(forKey: "schedule_date") ?? ""
        let scheduleCount = defaults.integer(forKey: "schedule_count")
        
        var schedules: [ScheduleItem] = []
        if let jsonString = defaults.string(forKey: "schedule_list"),
           let data = jsonString.data(using: .utf8),
           let jsonArray = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
            schedules = jsonArray.prefix(3).map { dict in
                ScheduleItem(
                    id: dict["id"] as? Int ?? 0,
                    title: dict["title"] as? String ?? "",
                    time: dict["time"] as? String ?? ""
                )
            }
        }
        return ScheduleData(tripId: tripId, tripTitle: tripTitle, scheduleDate: scheduleDate, schedules: schedules, totalCount: scheduleCount)
    }
}

// MARK: - Models
struct DDayData {
    let tripId: Int
    let tripTitle: String
    let dDayText: String
    static let placeholder = DDayData(tripId: -1, tripTitle: "여행을 선택하세요", dDayText: "D-?")
}

struct ScheduleItem: Identifiable {
    let id: Int
    let title: String
    let time: String
}

struct ScheduleData {
    let tripId: Int
    let tripTitle: String
    let scheduleDate: String
    let schedules: [ScheduleItem]
    let totalCount: Int
    static let placeholder = ScheduleData(tripId: -1, tripTitle: "오늘의 일정", scheduleDate: "", schedules: [], totalCount: 0)
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (6자리)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (8자리)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 255, 255, 255)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - D-Day Widget
struct DDayEntry: TimelineEntry {
    let date: Date
    let data: DDayData
}

struct DDayProvider: TimelineProvider {
    func placeholder(in context: Context) -> DDayEntry {
        DDayEntry(date: Date(), data: .placeholder)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (DDayEntry) -> Void) {
        completion(DDayEntry(date: Date(), data: WidgetDataManager.shared.getDDayData()))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<DDayEntry>) -> Void) {
        let entry = DDayEntry(date: Date(), data: WidgetDataManager.shared.getDDayData())
        
        // 다음 자정에 업데이트 (D-Day 변경을 위해)
        let calendar = Calendar.current
        let tomorrow = calendar.startOfDay(for: calendar.date(byAdding: .day, value: 1, to: Date())!)
        
        completion(Timeline(entries: [entry], policy: .after(tomorrow)))
    }
}

struct DDayWidgetView: View {
    let entry: DDayEntry
    
    var bgColor: Color {
        if let defaults = UserDefaults(suiteName: "group.com.team1113.mytravelfriend"),
           let hex = defaults.string(forKey: "settings_bg_color") {
            return Color(hex: hex)
        }
        return Color.white
    }
    
    var textColor: Color {
        if let defaults = UserDefaults(suiteName: "group.com.team1113.mytravelfriend"),
           let hex = defaults.string(forKey: "settings_text_color") {
            return Color(hex: hex)
        }
        return Color(hex: "#333333")
    }
    
    var accentColor: Color {
        if let defaults = UserDefaults(suiteName: "group.com.team1113.mytravelfriend"),
           let hex = defaults.string(forKey: "settings_accent_color") {
            return Color(hex: hex)
        }
        return Color(hex: "#4A90D9")
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Text(entry.data.tripTitle)
                .font(.system(size: 14))
                .foregroundColor(textColor.opacity(0.7))
                .lineLimit(1)
            
            Text(entry.data.dDayText)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(accentColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .widgetURL(URL(string: "mytravelfriend://widget?type=WIDGET_TRIP&trip_id=\(entry.data.tripId)"))
        .containerBackground(bgColor, for: .widget)
    }
}

struct DDayWidget: Widget {
    let kind: String = "DDayWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: DDayProvider()) { entry in
            DDayWidgetView(entry: entry)
        }
        .configurationDisplayName("D-Day")
        .description("여행까지 남은 날짜를 확인하세요")
        .supportedFamilies([.systemSmall])
    }
}

// MARK: - Schedule Widget
struct ScheduleEntry: TimelineEntry {
    let date: Date
    let data: ScheduleData
}

struct ScheduleProvider: TimelineProvider {
    func placeholder(in context: Context) -> ScheduleEntry {
        ScheduleEntry(date: Date(), data: .placeholder)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ScheduleEntry) -> Void) {
        completion(ScheduleEntry(date: Date(), data: WidgetDataManager.shared.getScheduleData()))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ScheduleEntry>) -> Void) {
        let entry = ScheduleEntry(date: Date(), data: WidgetDataManager.shared.getScheduleData())
        
        // 다음 자정에 업데이트
        let calendar = Calendar.current
        let tomorrow = calendar.startOfDay(for: calendar.date(byAdding: .day, value: 1, to: Date())!)
        
        completion(Timeline(entries: [entry], policy: .after(tomorrow)))
    }
}

struct ScheduleWidgetView: View {
    let entry: ScheduleEntry
    
    var bgColor: Color {
        if let defaults = UserDefaults(suiteName: "group.com.team1113.mytravelfriend"),
           let hex = defaults.string(forKey: "settings_bg_color") {
            return Color(hex: hex)
        }
        return Color.white
    }
    
    var textColor: Color {
        if let defaults = UserDefaults(suiteName: "group.com.team1113.mytravelfriend"),
           let hex = defaults.string(forKey: "settings_text_color") {
            return Color(hex: hex)
        }
        return Color(hex: "#333333")
    }
    
    var accentColor: Color {
        if let defaults = UserDefaults(suiteName: "group.com.team1113.mytravelfriend"),
           let hex = defaults.string(forKey: "settings_accent_color") {
            return Color(hex: hex)
        }
        return Color(hex: "#4A90D9")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(entry.data.tripTitle)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(textColor)
                Spacer()
                Text(entry.data.scheduleDate)
                    .font(.system(size: 11))
                    .foregroundColor(textColor.opacity(0.6))
            }
            
            Divider()
            
            if entry.data.schedules.isEmpty {
                Spacer()
                HStack {
                    Spacer()
                    Text("오늘 일정이 없어요")
                        .font(.system(size: 13))
                        .foregroundColor(textColor.opacity(0.5))
                    Spacer()
                }
                Spacer()
            } else {
                ForEach(entry.data.schedules) { schedule in
                    HStack(spacing: 8) {
                        Text(schedule.time)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(accentColor)
                            .frame(width: 50, alignment: .leading)
                        Text(schedule.title)
                            .font(.system(size: 13))
                            .foregroundColor(textColor)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
                
                if entry.data.totalCount > 3 {
                    Text("+\(entry.data.totalCount - 3)개 더보기")
                        .font(.system(size: 11))
                        .foregroundColor(accentColor)
                }
            }
        }
        .padding(12)
        .widgetURL(URL(string: "mytravelfriend://widget?type=WIDGET_SCHEDULE&trip_id=\(entry.data.tripId)"))
        .containerBackground(bgColor, for: .widget)
    }
}

struct ScheduleWidget: Widget {
    let kind: String = "ScheduleWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ScheduleProvider()) { entry in
            ScheduleWidgetView(entry: entry)
        }
        .configurationDisplayName("오늘의 일정")
        .description("오늘의 여행 일정을 확인하세요")
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge])
    }
}
