//
//  Extensions+Data.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 30.05.2023.
//

import Foundation

extension Date {
    
    func weekDay() -> Int {
        var calendar = Calendar(identifier: .iso8601)
        calendar.firstWeekday = 1
        calendar.timeZone = TimeZone(abbreviation: "UTC") ?? .current
        let weekday = calendar.component(.weekday, from: self)
        return weekday == 1 ? 8 : weekday
    }

    func formatFromDateToString(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC") ?? .current
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
}

