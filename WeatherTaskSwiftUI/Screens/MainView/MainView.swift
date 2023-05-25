//
//  ContentView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ShortInformationView()
                TemperatureTextView(textSize: proxy.size.height / 100.0 * 16.0)
                VStack(spacing: 8.0) {
                    SearchView()
                    DailySummaryView(iconSize: proxy.size.height / 100.0 * 8.0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
