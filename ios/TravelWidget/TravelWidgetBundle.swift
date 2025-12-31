//
//  TravelWidgetBundle.swift
//  TravelWidget
//
//  Created by Shiny Lee on 12/31/25.
//

import WidgetKit
import SwiftUI

@main
struct TravelWidgetBundle: WidgetBundle {
    var body: some Widget {
        DDayWidget()
        ScheduleWidget()
    }
}
