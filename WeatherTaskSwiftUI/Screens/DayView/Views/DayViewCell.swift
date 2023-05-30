//
//  DayViewCell.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DayViewCell: View {
    var time: String
    var feelsLike: String
    var humidity: String
    var wind: String
    var visibility: String
    var temperature: String
    
    var textSize: CGFloat
    
    var body: some View {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    DateView(dateText: time)
                    HourlyWeatherInformationView(feelsLike: feelsLike,
                                                 humidity: humidity,
                                                 wind: wind,
                                                 visibility: visibility)
                }
                .padding(.leading, 16.0)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(temperature)
                        .font(Font(R.font.interMedium(size: textSize) ?? .systemFont(ofSize: textSize, weight: .medium)))
                }
                .padding(.trailing, 16.0)
            }
    }
}
