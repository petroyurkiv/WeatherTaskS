//
//  DayViewModel.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 30.05.2023.
//

import Foundation

final class DayViewModel: ObservableObject {
    @Published var dateLabel: String
    @Published var list: [ForecastViewModel]
    
    init(weekDayData: WeekDayData) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        self.dateLabel = formatter.string(from: weekDayData.date)
        self.list = weekDayData.list.map { ForecastViewModel(visibilityLabel: String("VISIBILITY: \($0.visibility)"), windLabel: "WIND: \($0.wind.speed)") }
    }
}
