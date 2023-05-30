//
//  HourlyTemperatureView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct HourlyTemperatureView: View {
    var temperature: String
    var textSize: CGFloat
    
    var body: some View {
        Text(temperature)
//            .font(Font(R.font.interMedium(size: textSize) ?? .systemFont(ofSize: textSize, weight: .medium)))
    }
}

