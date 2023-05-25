//
//  WeeklyForecastView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct WeeklyForecastView: View {
    @Binding var viewModel: WeeklyForecastViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text(R.string.texts.weatherTaskSwiftUIWeeklyForecastViewTitle())
                    .font(.mySubtitle)
                    .padding(.leading, 16.0)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16.0) {
                        ForEach(0..<viewModel.temperatures.count,  id: \.self) { index in
                            WeeklyForecastItemView(width: (proxy.size.width - 80) / 4, day: viewModel.days[index], temperature: viewModel.temperatures[index], date: viewModel.dates[index])
                        }
                    }
                    .padding(.vertical, 2.0)
                    .padding(.horizontal, 16.0)
                }
            }
            .padding(.bottom, 16.0)
        }
    }
}
