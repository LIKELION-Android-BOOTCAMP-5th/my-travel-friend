package com.team1113.mytravelfriend

import HomeWidgetGlanceWidgetReceiver
import com.team1113.mytravelfriend.ScheduleGlanceWidget

class ScheduleWidgetReceiver : HomeWidgetGlanceWidgetReceiver<ScheduleGlanceWidget>() {
    override val glanceAppWidget = ScheduleGlanceWidget()
}