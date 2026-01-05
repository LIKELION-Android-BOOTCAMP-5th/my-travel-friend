package com.team1113.mytravelfriend

import HomeWidgetGlanceState
import HomeWidgetGlanceStateDefinition
import android.content.Context
import android.graphics.Color
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
import androidx.core.net.toUri

class DDayGlanceWidget : GlanceAppWidget() {
    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    // 기존 parseColor 로직을 ComposeColor용으로 변환
    private fun parseComposeColor(colorString: String, defaultColor: ComposeColor): ComposeColor {
        return try {
            ComposeColor(Color.parseColor(colorString))
        } catch (e: Exception) {
            defaultColor
        }
    }

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            val state = currentState<HomeWidgetGlanceState>()
            val prefs = state.preferences

            // 1. 데이터 읽기
            val tripId = prefs.getInt("dday_trip_id", -1)
            val tripTitle = prefs.getString("dday_trip_title", "여행을 선택하세요") ?: "여행을 선택하세요"
            val dDayText = prefs.getString("dday_text", "D-?") ?: "D-?"

            // 2. 테마 색상 읽기 (기존 코드와 동일한 키값)
            val bgColorStr = prefs.getString("settings_bg_color", "#FFFFFFFF") ?: "#FFFFFFFF"
            val textColorStr = prefs.getString("settings_text_color", "#FF333333") ?: "#FF333333"
            val accentColorStr = prefs.getString("settings_accent_color", "#FF4A90D9") ?: "#FF4A90D9"

            val bgColor = parseComposeColor(bgColorStr, ComposeColor.White)
            val textColor = parseComposeColor(textColorStr, ComposeColor.DarkGray)
            val accentColor = parseComposeColor(accentColorStr, ComposeColor.Blue)

            // 3. UI 구성 (widget_dday.xml의 구조를 본뜸)
            Box(
                modifier = GlanceModifier
                    .fillMaxSize()
                    .background(bgColor) // 배경색 적용
                    .padding(16.dp)
                    .clickable(
                        if (tripId > 0) {
                            actionStartActivity<MainActivity>(
                                context,
                                uri = Uri.parse("mytravelfriend://widget?type=WIDGET_TRIP&trip_id=$tripId")
                            )
                        } else {
                            // tripId가 없을 때 앱 메인 실행
                            actionStartActivity<MainActivity>(context)
                        }
                    ),
                contentAlignment = Alignment.Center
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // 여행 제목 (tv_trip_title)
                    Text(
                        text = tripTitle,
                        style = TextStyle(
                            fontSize = 16.sp,
                            color = ColorProvider(textColor),
                            textAlign = TextAlign.Center
                        ),
                        maxLines = 1
                    )

                    Spacer(modifier = GlanceModifier.height(8.dp))

                    // D-Day (tv_dday)
                    Text(
                        text = dDayText,
                        style = TextStyle(
                            fontSize = 32.sp,
                            fontWeight = FontWeight.Bold,
                            color = ColorProvider(accentColor),
                            textAlign = TextAlign.Center
                        )
                    )
                }
            }
        }
    }
}