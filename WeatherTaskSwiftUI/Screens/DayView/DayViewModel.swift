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
        formatter.dateFormat = "MMM d, h:mm a"
        self.dateLabel = formatter.string(from: weekDayData.date)
        self.list = weekDayData.list.map { ForecastViewModel(temperatureLabel: String(Int($0.main.temp)) + "°",
                                                             feelsLikeLabel: String(Int($0.main.feelsLike)) + "°",
                                                             humidityLabel: String(Int($0.main.humidity)) + "%",
                                                             visibilityLabel: String($0.visibility / 1000) + "km",
                                                             windLabel: String(Int($0.wind.speed)) + "km/h")
            
        }
    }
}
