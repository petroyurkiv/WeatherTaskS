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
    
    var textSize: CGFloat
    
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
            Spacer()
            VStack(alignment: .trailing) {
                Text(temperature)
                    .font(Font(R.font.interMedium(size: textSize)!))
            }
            .padding(.trailing, 16)
        }
        .background(Color(R.color.bgSunnyColor()!))
    }
}

struct DayViewCell_Previews: PreviewProvider {
     static var previews: some View {
         DayViewCell(dateText: "трав.30, 12:00 пп", feelsLike: "18;", humidity: "66%", wind: "3km/h", visibility: "10km", temperature: "1;", textSize: 64)
     }
 }

