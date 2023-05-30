//
//  WeatherInformationView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct HourlyWeatherInformationView: View {
    var feelsLike: String
    var humidity: String
    var wind: String
    var visibility: String
    
    var body: some View {
        HStack(spacing: 24) {
            VStack(alignment: .leading ,spacing: 12) {
                Text("feels Like: \(feelsLike)")
                    .font(Font(R.font.interMedium(size: 16) ?? .systemFont(ofSize: 16.0, weight: .medium)))
                Text("humidity: \(humidity)")
                    .font(Font(R.font.interMedium(size: 16) ?? .systemFont(ofSize: 16.0, weight: .medium)))
            }
            VStack(alignment: .leading ,spacing: 12) {
                Text("wind: \(wind)")
                    .font(Font(R.font.interMedium(size: 16) ?? .systemFont(ofSize: 16.0, weight: .medium)))
                Text("visibility: \(visibility)")
                    .font(Font(R.font.interMedium(size: 16) ?? .systemFont(ofSize: 16.0, weight: .medium)))
            }
        }
    }
}

