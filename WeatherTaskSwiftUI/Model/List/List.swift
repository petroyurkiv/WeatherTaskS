//
//  List.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import Foundation

struct List: Decodable {
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let visibility: Int
    let date: Date
    
    private enum CodingKeys: String, CodingKey {
        case main, weather, wind, visibility
        case date = "dt_txt"
    }
}
