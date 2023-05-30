//
//  Main.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import Foundation

struct Main: Decodable {
    let temp: Float
    let feelsLike: Float
    let humidity: Float
    
    private enum CodingKeys: String, CodingKey {
        case temp, humidity
        case feelsLike = "feels_like"
    }
}
