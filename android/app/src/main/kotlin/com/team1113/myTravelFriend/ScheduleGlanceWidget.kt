package com.team1113.mytravelfriend
import HomeWidgetGlanceState
import HomeWidgetGlanceStateDefinition
import android.content.Context
import android.net.Uri
import androidx.compose.ui.graphics.Color as ComposeColor
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.*
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.provideContent
import androidx.glance.layout.*
import androidx.glance.text.*
import androidx.glance.unit.ColorProvider
import es.antonborri.home_widget.actionStartActivity
import org.json.JSONArray

class ScheduleGlanceWidget : GlanceAppWidget() {
    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    private fun parseComposeColor(colorString: String, defaultColor: ComposeColor): ComposeColor {
        return try {
            ComposeColor(android.graphics.Color.parseColor(colorString))
        } catch (e: Exception) {
            defaultColor
        }
    }

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            val state = currentState<HomeWidgetGlanceState>()
            val prefs = state.preferences

            // 1. 데이터 추출
            val tripId = prefs.getInt("schedule_trip_id", -1)
            val tripTitle = prefs.getString("schedule_trip_title", "오늘의 일정") ?: "오늘의 일정"
            val scheduleDate = prefs.getString("schedule_date", "") ?: ""
            val scheduleListJson = prefs.getString("schedule_list", "[]") ?: "[]"
            val scheduleCount = prefs.getInt("schedule_count", 0)

            // 2. 테마 색상 설정
            val bgColorStr = prefs.getString("settings_bg_color", "#FFFFFFFF") ?: "#FFFFFFFF"
            val textColorStr = prefs.getString("settings_text_color", "#FF333333") ?: "#FF333333"
            val accentColorStr = prefs.getString("settings_accent_color", "#FF4A90D9") ?: "#FF4A90D9"

            val bgColor = parseComposeColor(bgColorStr, ComposeColor.White)
            val textColor = parseComposeColor(textColorStr, ComposeColor.DarkGray)
            val accentColor = parseComposeColor(accentColorStr, ComposeColor.Blue)

            // 3. JSON 파싱 (최대 3개 추출)
            val items = mutableListOf<Pair<String, String>>()
            try {
                val jsonArray = JSONArray(scheduleListJson)
                val displayCount = minOf(jsonArray.length(), 3)
                for (i in 0 until displayCount) {
                    val obj = jsonArray.getJSONObject(i)
                    items.add(obj.optString("time", "") to obj.optString("title", ""))
                }
            } catch (e: Exception) { /* 에러 처리 */ }

            // 4. UI 구성
            Column(
                modifier = GlanceModifier
                    .fillMaxSize()
                    .background(bgColor)
                    .padding(12.dp)
                    .clickable(
                        actionStartActivity<MainActivity>(
                            context,
                            if (tripId > 0)
                                Uri.parse("mytravelfriend://widget?type=WIDGET_SCHEDULE&trip_id=$tripId")
                            else
                                Uri.parse("mytravelfriend://widget?type=DEFAULT")
                        )
                    )
            ) {
                // 헤더 (제목 & 날짜)
                Row(modifier = GlanceModifier.fillMaxWidth(), horizontalAlignment = Alignment.End) {
                    Text(
                        text = tripTitle,
                        modifier = GlanceModifier.defaultWeight(),
                        style = TextStyle(fontSize = 15.sp, fontWeight = FontWeight.Bold, color = ColorProvider(textColor))
                    )
                    Text(
                        text = scheduleDate,
                        style = TextStyle(fontSize = 11.sp, color = ColorProvider(textColor))
                    )
                }

                Spacer(modifier = GlanceModifier.height(8.dp))

                if (items.isEmpty()) {
                    // 일정 없음
                    Box(modifier = GlanceModifier.defaultWeight(), contentAlignment = Alignment.Center) {
                        Text(text = "일정이 없습니다.", style = TextStyle(color = ColorProvider(textColor), fontSize = 13.sp))
                    }
                } else {
                    // 일정 리스트 (최대 3개)
                    Column(modifier = GlanceModifier.defaultWeight()) {
                        items.forEach { (time, title) ->
                            Row(modifier = GlanceModifier.padding(vertical = 2.dp), verticalAlignment = Alignment.CenterVertically) {
                                Text(
                                    text = time,
                                    style = TextStyle(fontSize = 12.sp, color = ColorProvider(accentColor), fontWeight = FontWeight.Bold)
                                )
                                Spacer(modifier = GlanceModifier.width(6.dp))
                                Text(
                                    text = title,
                                    maxLines = 1,
                                    style = TextStyle(fontSize = 13.sp, color = ColorProvider(textColor))
                                )
                            }
                        }
                    }

                    // 더보기 표시
                    if (scheduleCount > 3) {
                        Text(
                            text = "+${scheduleCount - 3}개 더보기",
                            style = TextStyle(fontSize = 11.sp, color = ColorProvider(accentColor), fontWeight = FontWeight.Bold),
                            modifier = GlanceModifier.padding(top = 4.dp)
                        )
                    }
                }
            }
        }
    }
}