//
//  MainViewModel.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var shortInformationViewModel = ShortInformationViewModel()
    @Published var temperatureTextViewModel = TemperatureTextViewModel()
    @Published var dailySummaryViewModel = DailySummaryViewModel()
    @Published var weeklyForecastViewModel = WeeklyForecastViewModel()
    
    @Published var isLoading = false
    @Published var errorText: String?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        errorText = nil
        isLoading = true
        CityWeatherManagerService.fetchData(city: "Lviv") { [weak self] response in
            guard let self else { return }
            
            switch response {
            case.success(let result):
                DispatchQueue.main.async {
                    self.shortInformationViewModel = self.adaptDomainModelsToShortInformationViewModel(model: result)
                    self.temperatureTextViewModel = self.adaptDomainModelsToTemperatureTextViewModel(model: result)
                    self.dailySummaryViewModel = self.adaptDomainModelsToDailySummaryViewModel(model: result)
                    self.weeklyForecastViewModel = self.adaptDomainModelsToWeeklyForecastViewModel(model: result)
                }
                
            case.failure(let error):
                DispatchQueue.main.async {
                    self.errorText = error.localizedDescription
                }
            }
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
    
    private func adaptDomainModelsToShortInformationViewModel(model: WeatherResult) -> ShortInformationViewModel {
        return ShortInformationViewModel(city: model.city.name)
    }
    
    private func adaptDomainModelsToTemperatureTextViewModel(model: WeatherResult) -> TemperatureTextViewModel {
        return TemperatureTextViewModel(temperature: String(Int(model.list.first?.main.temp ?? 0)) + "°")
    }
    
    private func adaptDomainModelsToDailySummaryViewModel(model: WeatherResult) -> DailySummaryViewModel {
        let list = model.list
        return DailySummaryViewModel(
            wind: String((list.first?.wind.speed ?? 0)) + "km/h",
            humidity: String(Int(list.first?.main.humidity ?? 0)) + "%",
            visibility: String((list.first?.visibility ?? 0) / 1000) + "km"
        )
    }
    
    private func setFormattedDateToArray(array: [Date], dateFormat: String) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        var dates = [String]()
        for i in array {
            let date = dateFormatter.string(from: i)
            dates.append(date)
        }
        return dates
    }
    
    private func formatFromDateToString(date: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    private func filterDateArray(_ array: [String]) -> [String] {
        let setArray = NSOrderedSet(array: array)
        return setArray.compactMap { $0 as? String }
    }
    
    private func adaptDomainModelsToWeeklyForecastViewModel(model: WeatherResult) -> WeeklyForecastViewModel {
        let list = model.list
        var dates: [Date] = []
        
        let firstHour = formatFromDateToString(date: list.first!.date, dateFormat: "HH:mm")
        var temperatures: [String] = []
        
        for i in list {
            dates.append(i.date)
            
            let hour = formatFromDateToString(date: i.date, dateFormat: "HH:mm")
            if firstHour == hour {
                temperatures.append(String(Int(i.main.temp)) + "°")
            }
        }
        print(temperatures)
        print(dates)
        return WeeklyForecastViewModel(
            days: filterDateArray(setFormattedDateToArray(array: dates, dateFormat: "E")),
            temperatures: temperatures,
            dates: filterDateArray(setFormattedDateToArray(array: dates, dateFormat: "MMM dd"))
        )
    }
}


