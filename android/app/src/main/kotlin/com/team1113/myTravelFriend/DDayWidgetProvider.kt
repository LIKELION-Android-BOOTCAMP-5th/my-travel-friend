package com.team1113.mytravelfriend

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.graphics.Color
import android.net.Uri
import android.app.PendingIntent
import android.content.Intent
import android.widget.RemoteViews

class DDayWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    companion object {
        private const val PREFS_NAME = "HomeWidgetPreferences"

        private fun parseColor(colorString: String, defaultColor: Int): Int {
            return try {
                Color.parseColor(colorString)
            } catch (e: Exception) {
                defaultColor
            }
        }
        
        private fun calculateDDayText(startDateStr: String?): String {
            if (startDateStr.isNullOrEmpty()) return "D-?"

            return try {
                val dateOnly = startDateStr.split("T")[0]
                val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd")
                val startDate = LocalDate.parse(dateOnly, formatter)
                val today = LocalDate.now()
                val days = ChronoUnit.DAYS.between(today, startDate)

                when {
                    days > 0 -> "D-$days"
                    days == 0L -> "D-Day"
                    else -> "D+${-days}"
                }
            } catch (e: Exception) {
                "D-?"
            }
        }

        internal fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

            val tripId = prefs.getInt("dday_trip_id", -1)
            val tripTitle = prefs.getString("dday_trip_title", "여행을 선택하세요") ?: "여행을 선택하세요"
            val startDate = prefs.getString("dday_start_date", null)
            val dDayText = calculateDDayText(startDate)

            // 테마 색상 읽기 (ARGB 형식 지원)
            val bgColorStr = prefs.getString("settings_bg_color", "#FFFFFFFF") ?: "#FFFFFFFF"
            val textColorStr = prefs.getString("settings_text_color", "#FF333333") ?: "#FF333333"
            val accentColorStr = prefs.getString("settings_accent_color", "#FF4A90D9") ?: "#FF4A90D9"

            val bgColor = parseColor(bgColorStr, Color.WHITE)
            val textColor = parseColor(textColorStr, Color.DKGRAY)
            val accentColor = parseColor(accentColorStr, Color.BLUE)

            val views = RemoteViews(context.packageName, R.layout.widget_dday)

            // 배경색 적용
            views.setInt(R.id.widget_container, "setBackgroundColor", bgColor)

            // 텍스트 색상 적용
            views.setTextColor(R.id.tv_trip_title, textColor)
            views.setTextColor(R.id.tv_dday, accentColor)

            views.setTextViewText(R.id.tv_trip_title, tripTitle)
            views.setTextViewText(R.id.tv_dday, dDayText)

            if (tripId > 0) {
                val intent = Intent(context, MainActivity::class.java).apply {
                    action = "es.antonborri.home_widget.action.LAUNCH"
                    data = Uri.parse("homewidget://trip/$tripId")
                }
                intent.setPackage(context.packageName)
                val pendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_container, pendingIntent)
            } else {
                val intent = context.packageManager.getLaunchIntentForPackage(context.packageName)
                val pendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_container, pendingIntent)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
