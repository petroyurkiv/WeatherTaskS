//
//  ForecastViewModel.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 30.05.2023.
//

import Foundation

struct ForecastViewModel: Identifiable {
    let id = UUID()
    let visibilityLabel: String
    let windLabel: String
}
