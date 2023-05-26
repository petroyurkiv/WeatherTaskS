//
//  Extensions+MainViewModel.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 26.05.2023.
//

import SwiftUI

extension MainViewModel {
    func setFormattedDateToArray(array: [Date], dateFormat: String) -> [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        var dates = [String]()
        for i in array {
            let date = dateFormatter.string(from: i)
            dates.append(date)
        }
        return dates
    }

    func formatFromDateToString(date: Date, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }

    func filterDateArray(_ array: [String]) -> [String] {
        let setArray = NSOrderedSet(array: array)
        return setArray.compactMap { $0 as? String }
    }
}

