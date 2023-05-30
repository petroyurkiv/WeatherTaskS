//
//  DayViewCell.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DayViewCell: View {
    var dateText: String
    var feelsLike: String
    var humidity: String
    var wind: String
    var visibility: String
    var temperature: String
    
    var width, height, textSize: CGFloat
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                DateView(dateText: dateText)
                HourlyWeatherInformationView(feelsLike: feelsLike,
                                             humidity: humidity,
                                             wind: wind,
                                             visibility: visibility)
            }
            .padding(.leading, 16)
            .padding(.bottom, 10)
            HourlyTemperatureView(temperature: temperature, textSize: textSize)
        }
        .frame(maxWidth: width, minHeight: height)
        .background(Color(R.color.bgSunnyColor()!))
    }
}

