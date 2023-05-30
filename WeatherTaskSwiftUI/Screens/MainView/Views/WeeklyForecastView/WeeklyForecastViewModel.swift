//
//  WeeklyForecastViewModel.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import Foundation

struct WeeklyForecastViewModel {
    var days = [DayCellViewModel]()
}

struct DayCellViewModel: Identifiable {
    var id: UUID
    let weekdayLabel: String
    let temperatureLabel: String
    let dateLabel: String
}

struct WeekDayData {
    let date: Date
    let list: [List]
}
