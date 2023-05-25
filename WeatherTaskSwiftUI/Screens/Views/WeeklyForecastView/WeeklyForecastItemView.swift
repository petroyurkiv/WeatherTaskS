//
//  WeeklyForecastViewItem.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct WeeklyForecastItemView: View {
    var width: CGFloat
    var day, temperature, date: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14.0).stroke(.black, lineWidth: 4.0)
            VStack(spacing: 8.0) {
                Text(day)
                    .font(.mySubtitle)
                Text(temperature)
                    .font(.myTitle)
                Text(date)
                    .font(.myDescriptionText)
            }
        }
        .frame(minWidth: width, maxHeight: .infinity)
    }
}

