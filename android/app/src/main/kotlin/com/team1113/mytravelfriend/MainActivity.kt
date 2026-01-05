package com.team1113.mytravelfriend

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // WorkManager 스케줄링
        WidgetUpdateWorker.schedule(this)
    }
}
