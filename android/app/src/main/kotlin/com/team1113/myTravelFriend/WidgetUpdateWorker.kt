package com.team1113.mytravelfriend

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.util.Log
import androidx.work.*
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import java.util.concurrent.TimeUnit

class WidgetUpdateWorker(
    private val context: Context,
    params: WorkerParameters
) : CoroutineWorker(context, params) {

    companion object {
        private const val TAG = "WidgetUpdateWorker"
        private const val UNIQUE_WORK_NAME = "widget_daily_update"

        fun schedule(context: Context) {
            Log.d(TAG, "Scheduling daily widget update")

            val constraints = Constraints.Builder()
                .setRequiredNetworkType(NetworkType.CONNECTED)
                .build()

            // 15분마다 실행 (WorkManager 최소 간격)
            // 실제로는 매일 자정 이후 첫 실행에서 날짜 변경 감지
            val request = PeriodicWorkRequestBuilder<WidgetUpdateWorker>(
                15, TimeUnit.MINUTES
            )
                .setConstraints(constraints)
                .setInitialDelay(calculateInitialDelay(), TimeUnit.MILLISECONDS)
                .build()

            WorkManager.getInstance(context)
                .enqueueUniquePeriodicWork(
                    UNIQUE_WORK_NAME,
                    ExistingPeriodicWorkPolicy.KEEP,
                    request
                )

            Log.d(TAG, "Widget update scheduled")
        }

        fun scheduleImmediate(context: Context) {
            val request = OneTimeWorkRequestBuilder<WidgetUpdateWorker>()
                .setConstraints(
                    Constraints.Builder()
                        .setRequiredNetworkType(NetworkType.CONNECTED)
                        .build()
                )
                .build()

            WorkManager.getInstance(context).enqueue(request)
        }

        private fun calculateInitialDelay(): Long {
            val now = System.currentTimeMillis()
            val calendar = java.util.Calendar.getInstance().apply {
                timeInMillis = now
                set(java.util.Calendar.HOUR_OF_DAY, 0)
                set(java.util.Calendar.MINUTE, 5)
                set(java.util.Calendar.SECOND, 0)
                set(java.util.Calendar.MILLISECOND, 0)
                add(java.util.Calendar.DAY_OF_MONTH, 1)
            }
            return calendar.timeInMillis - now
        }
    }

    override suspend fun doWork(): Result {
        Log.d(TAG, "Widget update worker started")

        return try {
            // home_widget 백그라운드 콜백 호출
            HomeWidgetBackgroundIntent.getBroadcast(
                context,
                android.net.Uri.parse("homewidget://widget_update")
            ).send()

            // 네이티브 위젯도 직접 갱신 (D-Day 계산용)
            updateNativeWidgets()

            Log.d(TAG, "Widget update completed successfully")
            Result.success()
        } catch (e: Exception) {
            Log.e(TAG, "Widget update failed", e)
            Result.retry()
        }
    }

    private fun updateNativeWidgets() {
        val appWidgetManager = AppWidgetManager.getInstance(context)

        // D-Day 위젯 갱신
        val ddayWidgetIds = appWidgetManager.getAppWidgetIds(
            ComponentName(context, DDayWidgetProvider::class.java)
        )
        for (widgetId in ddayWidgetIds) {
            DDayWidgetProvider.updateAppWidget(context, appWidgetManager, widgetId)
        }

        // 일정 위젯 갱신
        val scheduleWidgetIds = appWidgetManager.getAppWidgetIds(
            ComponentName(context, ScheduleWidgetProvider::class.java)
        )
        for (widgetId in scheduleWidgetIds) {
            ScheduleWidgetProvider.updateAppWidget(context, appWidgetManager, widgetId)
        }
    }
}
