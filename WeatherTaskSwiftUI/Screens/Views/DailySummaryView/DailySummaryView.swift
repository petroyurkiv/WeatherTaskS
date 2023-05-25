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
            Text(R.string.texts.weatherTaskSwiftUIDailySummaryViewTitle())
                .font(.mySubtitle)
            HStack(spacing: 8.0) {
                DailySumarryItemView(iconSize: iconSize,
                                     image: R.image.windImage()!,
                                     title: "35" + "km/h",
                                     subtitle: R.string.texts.weatherTaskSwiftUIDailySummaryViewItemSubitleWind())
                
                DailySumarryItemView(iconSize: iconSize,
                                     image: R.image.humidityImage()!,
                                     title: "40" + "%",
                                     subtitle: R.string.texts.weatherTaskSwiftUIDailySummaryViewItemSubitleHumidity())
                
                DailySumarryItemView(iconSize: iconSize,
                                     image: R.image.visibilityImage()!,
                                     title: "1.2km" + "km",
                                     subtitle: R.string.texts.weatherTaskSwiftUIDailySummaryViewItemSubitleVisibility())
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
