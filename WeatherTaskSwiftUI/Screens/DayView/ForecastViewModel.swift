//
//  ForecastViewModel.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 30.05.2023.
//

import Foundation

struct ForecastViewModel: Identifiable {
    let id = UUID()
    let timeLabel: String
    let temperatureLabel: String
    let feelsLikeLabel: String
    let humidityLabel: String
    let visibilityLabel: String
    let windLabel: String
}
