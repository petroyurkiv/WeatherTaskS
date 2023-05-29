//
//  WeatherInformationView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct HourlyWeatherInformationView: View {
    var body: some View {
        HStack(spacing: 24) {
            VStack(alignment: .leading ,spacing: 12) {
                Text("feels like: 13°")
                    .font(Font(R.font.interMedium(size: 16)!))
                Text("humidity: 40%")
                    .font(Font(R.font.interMedium(size: 16)!))
            }
            VStack(alignment: .leading ,spacing: 12) {
                Text("wind: 45km/h")
                    .font(Font(R.font.interMedium(size: 16)!))
                Text("visibility: 1.2km")
                    .font(Font(R.font.interMedium(size: 16)!))
            }
        }
    }
}

struct WeatherInformationView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherInformationView()
    }
}
