//
//  MainViewModel.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import Foundation
import CoreLocation
import Combine

class MainViewModel: ObservableObject {
    private let locationManager = LocationManager()
    
    @Published var shortInformationViewModel = ShortInformationViewModel()
    @Published var temperatureTextViewModel = TemperatureTextViewModel()
    @Published var dailySummaryViewModel = DailySummaryViewModel()
    @Published var weeklyForecastViewModel = WeeklyForecastViewModel()
    
    @Published var isLoading = false
    @Published var errorText: String?
    @Published var searchedCity: String = ""
    var weekdaysData: [UUID: WeekDayData] = [:]
    var bag = Set<AnyCancellable>()
    
    init() {
        locationManager.requestAuthorization()
        locationManager.requestLocation()
        locationManager.onLocationResult = { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(location):
                self.fetchData(latitude: location.latitude, lognitube: location.longitude)
                
            case .failure:
                self.isLoading = false
                self.errorText = "Can't detect your location"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.errorText = nil
                    self.isLoading = true
                })
            }
        }
        
        $searchedCity.sink { [weak self] cityName in
            self?.fetchData(city: cityName)
        }.store(in: &bag)
    }
    
    func fetchData(latitude: CLLocationDegrees, lognitube: CLLocationDegrees) {
        isLoading = true
        errorText = nil
        CoordinatesWeatherManagerService.fetchData(latitude: latitude, longitude: lognitube) { [weak self] response in
            self?.handleResponse(response)
        }
    }
    
    func fetchData(city: String) {
        isLoading = true
        guard !city.isEmpty else { return }
        
        errorText = nil
        CityWeatherManagerService.fetchData(city: city) { [weak self] response in
            self?.handleResponse(response)
        }
    }
    
    private func handleResponse(_ response: Result<WeatherResult, Error>) {
        switch response {
        case .success(let result):
            DispatchQueue.main.async {
                self.shortInformationViewModel = self.adaptDomainModelsToShortInformationViewModel(model: result)
                self.temperatureTextViewModel = self.adaptDomainModelsToTemperatureTextViewModel(model: result)
                self.dailySummaryViewModel = self.adaptDomainModelsToDailySummaryViewModel(model: result)
                self.weeklyForecastViewModel = self.adaptDomainModelsToWeeklyForecastViewModel(model: result)
            }
            
        case .failure:
            DispatchQueue.main.async {
                self.errorText = "Something went wrong"
            }
        }
        DispatchQueue.main.async {
            self.isLoading = false
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
    
    private func adaptDomainModelsToWeeklyForecastViewModel(model: WeatherResult) -> WeeklyForecastViewModel {
        var weekdays: [Int: [List]] = [:]
        
        for day in model.list {
            let weekDay = weekDay(of: day.date)
            
            if weekdays[weekDay] != nil {
                weekdays[weekDay]?.append(day)
            } else {
                weekdays[weekDay] = [day]
            }
        }
        
        let sortedWeekdays = weekdays.sorted { $0.key < $1.key }
        
        var cellViewModels: [DayCellViewModel] = []
        var weekdaysData: [UUID: WeekDayData] = [:]
        for sortedWeekday in sortedWeekdays {
            let id = UUID()
            var weekdayLabel = ""
            var temperatureLabel = ""
            var dateLabel = ""
            
            if let weekday = sortedWeekday.value.first {
                weekdayLabel = formatFromDateToString(date: weekday.date, dateFormat: "E")
                dateLabel = formatFromDateToString(date: weekday.date, dateFormat: "MMM dd")
                temperatureLabel = String(Int(weekday.main.temp))
                weekdaysData[id] = WeekDayData(date: weekday.date, list: sortedWeekday.value)
                
            }
            
            let dayCellViewModel = DayCellViewModel(
                id: id,
                weekdayLabel: weekdayLabel,
                temperatureLabel: temperatureLabel,
                dateLabel: dateLabel
            )
            
            cellViewModels.append(dayCellViewModel)
        }
        self.weekdaysData = weekdaysData
        return WeeklyForecastViewModel(days: cellViewModels)
    }
    
    private func weekDay(of date: Date) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        return calendar.component(.weekday, from: date)
    }
    
    private func formatFromDateToString(date: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}


