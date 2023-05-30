//
//  ContentView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorText = viewModel.errorText {
                    Text("ERROR: \(errorText)")
                        .lineLimit(2)
                        .frame(height: 60.0)
                }
                
                if viewModel.isLoading {
                        LoadingView()
                        .frame(height: 60.0)
                }
                
                GeometryReader { proxy in
                    VStack {
                        ShortInformationView(viewModel: $viewModel.shortInformationViewModel)
                        TemperatureTextView(viewModel: $viewModel.temperatureTextViewModel, textSize: proxy.size.height / 100.0 * 16.0)
                        VStack(spacing: 8.0) {
                            SearchView(searchedCity: $viewModel.searchedCity)
                            DailySummaryView(viewModel: $viewModel.dailySummaryViewModel, iconSize: proxy.size.height / 100.0 * 8.0)
                            WeeklyForecastView(viewModel: $viewModel.weeklyForecastViewModel,
                                               getWeekDayDataByUUID: { viewModel.weekdaysData[$0]! })
                        }
                    }
                    .background(Color(R.color.bgSunnyColor()!))
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
