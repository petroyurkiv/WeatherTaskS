//
//  WeeklyForecastView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct WeeklyForecastView: View {
    var array = ["a", "b", "c", "d"]
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Text("Weekly forecast")
                    .font(.mySubtitle)
                    .padding(.leading, 16.0)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16.0) {
                        ForEach(array, id: \.self, content: { item in
                            WeeklyForecastItemView(width: (proxy.size.width - 80) / 4, day: "TUE", temperature: "23", date: "April")
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
