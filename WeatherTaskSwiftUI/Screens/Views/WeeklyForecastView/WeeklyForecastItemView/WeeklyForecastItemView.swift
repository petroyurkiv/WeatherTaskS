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
                    .font(Font(R.font.interMedium(size: 20)!))
                Text(temperature)
                    .font(Font(R.font.interSemiBold(size: 32)!))
                Text(date)
                    .font(Font(R.font.interMedium(size: 16)!))
            }
        }
        .frame(minWidth: width, maxHeight: .infinity)
    }
}

