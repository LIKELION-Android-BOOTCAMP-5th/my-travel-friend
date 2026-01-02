package com.team1113.mytravelfriend

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.graphics.Color
import android.net.Uri
import android.app.PendingIntent
import android.content.Intent
import android.view.View
import android.widget.RemoteViews
import org.json.JSONArray

class ScheduleWidgetProvider : AppWidgetProvider() {

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

        internal fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

            val tripId = prefs.getInt("schedule_trip_id", -1)
            val tripTitle = prefs.getString("schedule_trip_title", "오늘의 일정") ?: "오늘의 일정"
            val scheduleDate = prefs.getString("schedule_date", "") ?: ""
            val scheduleListJson = prefs.getString("schedule_list", "[]") ?: "[]"
            val scheduleCount = prefs.getInt("schedule_count", 0)

            // 테마 색상 읽기 (ARGB 형식 지원)
            val bgColorStr = prefs.getString("settings_bg_color", "#FFFFFFFF") ?: "#FFFFFFFF"
            val textColorStr = prefs.getString("settings_text_color", "#FF333333") ?: "#FF333333"
            val accentColorStr = prefs.getString("settings_accent_color", "#FF4A90D9") ?: "#FF4A90D9"

            val bgColor = parseColor(bgColorStr, Color.WHITE)
            val textColor = parseColor(textColorStr, Color.DKGRAY)
            val accentColor = parseColor(accentColorStr, Color.BLUE)

            val views = RemoteViews(context.packageName, R.layout.widget_schedule)

            // 배경색 적용
            views.setInt(R.id.widget_container, "setBackgroundColor", bgColor)

            // 텍스트 색상 적용
            views.setTextColor(R.id.tv_trip_title, textColor)
            views.setTextColor(R.id.tv_date, textColor)
            views.setTextColor(R.id.tv_empty, textColor)
            views.setTextColor(R.id.tv_more, accentColor)

            views.setTextViewText(R.id.tv_trip_title, tripTitle)
            views.setTextViewText(R.id.tv_date, scheduleDate)

            try {
                val jsonArray = JSONArray(scheduleListJson)
                val itemCount = minOf(jsonArray.length(), 3)

                android.util.Log.d("ScheduleWidget", "itemCount: $itemCount, scheduleCount: $scheduleCount")

                if (itemCount == 0) {
                    // 일정이 없으면 tv_empty 표시
                    views.setViewVisibility(R.id.tv_empty, View.VISIBLE)
                    views.setViewVisibility(R.id.schedule_item_1, View.GONE)
                    views.setViewVisibility(R.id.schedule_item_2, View.GONE)
                    views.setViewVisibility(R.id.schedule_item_3, View.GONE)
                    views.setViewVisibility(R.id.tv_more, View.GONE)
                } else {
                    views.setViewVisibility(R.id.tv_empty, View.GONE)

                    for (i in 0 until 3) {
                        val itemId = when (i) {
                            0 -> R.id.schedule_item_1
                            1 -> R.id.schedule_item_2
                            else -> R.id.schedule_item_3
                        }
                        val timeId = when (i) {
                            0 -> R.id.tv_time_1
                            1 -> R.id.tv_time_2
                            else -> R.id.tv_time_3
                        }
                        val titleId = when (i) {
                            0 -> R.id.tv_schedule_1
                            1 -> R.id.tv_schedule_2
                            else -> R.id.tv_schedule_3
                        }

                        if (i < itemCount) {
                            val item = jsonArray.getJSONObject(i)
                            val time = item.optString("time", "")
                            val title = item.optString("title", "")

                            views.setViewVisibility(itemId, View.VISIBLE)
                            views.setTextViewText(timeId, time)
                            views.setTextViewText(titleId, title)
                            views.setTextColor(timeId, accentColor)
                            views.setTextColor(titleId, textColor)
                        } else {
                            views.setViewVisibility(itemId, View.GONE)
                        }
                    }

                    if (scheduleCount > 3) {
                        views.setViewVisibility(R.id.tv_more, View.VISIBLE)
                        views.setTextViewText(R.id.tv_more, "+${scheduleCount - 3}개 더보기")
                    } else {
                        views.setViewVisibility(R.id.tv_more, View.GONE)
                    }
                }

            } catch (e: Exception) {
                android.util.Log.e("ScheduleWidget", "Error parsing schedule: ${e.message}")
                views.setViewVisibility(R.id.tv_empty, View.VISIBLE)
                views.setViewVisibility(R.id.schedule_item_1, View.GONE)
                views.setViewVisibility(R.id.schedule_item_2, View.GONE)
                views.setViewVisibility(R.id.schedule_item_3, View.GONE)
                views.setViewVisibility(R.id.tv_more, View.GONE)
            }

            if (tripId > 0) {
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse("mytravelfriend://trip/$tripId/schedule"))
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