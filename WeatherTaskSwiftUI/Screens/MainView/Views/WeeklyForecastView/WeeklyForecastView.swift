//
//  WeeklyForecastView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct WeeklyForecastView: View {
    @Binding var viewModel: WeeklyForecastViewModel
    var getWeekDayDataByUUID: (UUID) -> WeekDayData?
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text(R.string.texts.weatherTaskSwiftUIWeeklyForecastViewTitle())
                    .font(Font(R.font.interSemiBold(size: 20.0) ?? .systemFont(ofSize: 20.0, weight: .semibold)))
                    .padding(.leading, 16.0)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16.0) {
                        ForEach(viewModel.days, content: { forecastData in
                            NavigationLink(
                                destination: {
                                    if let weekDayData = getWeekDayDataByUUID(forecastData.id) {
                                        DayView(dayViewModel: DayViewModel(weekDayData: weekDayData))
                                    }
                                },
                                label: {
                                    WeeklyForecastItemView(
                                        width: (proxy.size.width - 80) / 4,
                                        day: forecastData.weekdayLabel,
                                        temperature: forecastData.temperatureLabel,
                                        date: forecastData.dateLabel
                                    )
                                })
                        })
                    }
                    .padding(.vertical, 2.0)
                    .padding(.horizontal, 16.0)
                }
            }
            .padding(.bottom, 16.0)
        }
    }
}
