//
//  DailySummaryView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct DailySummaryView: View {
    var iconSize: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Daily summary")
                .font(.mySubtitle)
            HStack(spacing: 8.0) {
                DailySumarryItemView(iconSize: iconSize, image: "windImage", title: "35" + "km/h", subtitle: "Wind")
                DailySumarryItemView(iconSize: iconSize, image: "humidityImage", title: "40" + "%", subtitle: "Humidity")
                DailySumarryItemView(iconSize: iconSize, image: "visibilityImage", title: "1.2km" + "km", subtitle: "Visibility")
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 8.0)
            .background(Color(.black))
            .cornerRadius(24.0)
        }
        .padding(.horizontal, 16.0)
    }
}

struct DailySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        DailySummaryView(iconSize: 64.0)
    }
}
