//
//  DayView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DayView: View {
    
@State var dayViewModel: DayViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack() {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(dayViewModel.list) {
                            DayViewCell(dateText: dayViewModel.dateLabel,
                                        feelsLike: $0.feelsLikeLabel,
                                        humidity: $0.humidityLabel,
                                        wind: $0.windLabel,
                                        visibility: $0.visibilityLabel,
                                        temperature: $0.temperatureLabel,
                                        textSize: proxy.size.height / 100 * 7.6
                            )
                            .frame(width: proxy.size.width, height: proxy.size.height / 6)
                        }
                    }
                }
            }
        }
    }
}

