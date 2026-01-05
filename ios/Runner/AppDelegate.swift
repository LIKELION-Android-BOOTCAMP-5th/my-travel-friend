import UIKit
import Flutter
import home_widget
import BackgroundTasks

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        // home_widget 백그라운드 콜백 등록
        HomeWidgetBackgroundWorker.setPluginRegistrantCallback { registry in
            GeneratedPluginRegistrant.register(with: registry)
        }
        
        // BGTaskScheduler 등록
        registerBackgroundTasks()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // MARK: - Background Tasks
    
    private func registerBackgroundTasks() {
        BGTaskScheduler.shared.register(
            forTaskWithIdentifier: "com.team1113.mytravelfriend.widgetRefresh",
            using: nil
        ) { task in
            self.handleWidgetRefresh(task: task as! BGAppRefreshTask)
        }
    }
    
    private func handleWidgetRefresh(task: BGAppRefreshTask) {
        // 다음 실행 스케줄링
        scheduleWidgetRefresh()
        
        task.expirationHandler = {
            task.setTaskCompleted(success: false)
        }
        
        // home_widget 백그라운드 콜백 호출
        if let url = URL(string: "homewidget://widget_update") {
            HomeWidgetBackgroundWorker.run(url: url) { result in
                task.setTaskCompleted(success: result != nil)
            }
        } else {
            // 네이티브 위젯 갱신만 수행
            WidgetCenter.shared.reloadAllTimelines()
            task.setTaskCompleted(success: true)
        }
    }
    
    func scheduleWidgetRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.team1113.mytravelfriend.widgetRefresh")
        
        // 다음 자정 이후 실행
        let calendar = Calendar.current
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date()) {
            let midnight = calendar.startOfDay(for: tomorrow)
            request.earliestBeginDate = midnight.addingTimeInterval(300) // 자정 + 5분
        } else {
            request.earliestBeginDate = Date(timeIntervalSinceNow: 60 * 60) // 1시간 후
        }
        
        do {
            try BGTaskScheduler.shared.submit(request)
            print(" Widget refresh scheduled")
        } catch {
            print(" Failed to schedule widget refresh: \(error)")
        }
    }
    
    override func applicationDidEnterBackground(_ application: UIApplication) {
        scheduleWidgetRefresh()
    }
}
