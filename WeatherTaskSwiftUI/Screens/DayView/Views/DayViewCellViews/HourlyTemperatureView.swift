//
//  HourlyTemperatureView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct HourlyTemperatureView: View {
    var textSize: CGFloat
    
    var body: some View {
        Text("17°")
            .font(Font(R.font.interMedium(size: textSize)!))
            .padding(.trailing, 16)
            .padding(.top, 0)
    }
}

