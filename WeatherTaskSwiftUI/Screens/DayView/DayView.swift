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
                        VStack(spacing: 4.0) {
                            ForEach(dayViewModel.list) {
                                DayViewCell(time: $0.timeLabel,
                                            feelsLike: $0.feelsLikeLabel,
                                            humidity: $0.humidityLabel,
                                            wind: $0.windLabel,
                                            visibility: $0.visibilityLabel,
                                            temperature: $0.temperatureLabel,
                                            textSize: proxy.size.height / 100 * 7.6
                                )
                                .frame(width: proxy.size.width, height: proxy.size.height / 5.0)
                                .background(Color("bgSunnyColor"))
                            }
                        }
                        .padding(.vertical, 4.0)
                        .background(.black)
                    }
                }
        }
        .navigationTitle(dayViewModel.dateLabel)
    }
}
