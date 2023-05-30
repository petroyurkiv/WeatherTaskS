//
//  DailySummaryView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct DailySummaryView: View {
    @Binding var viewModel: DailySummaryViewModel
    var iconSize: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(R.string.texts.weatherTaskSwiftUIDailySummaryViewTitle())
                .font(Font(R.font.interSemiBold(size: 20.0) ?? .systemFont(ofSize: 20.0, weight: .semibold)))
            HStack(spacing: 8.0) {
                DailySumarryItemView(iconSize: iconSize,
                                     image: R.image.windImage()!,
                                     title: viewModel.wind,
                                     subtitle: R.string.texts.weatherTaskSwiftUIDailySummaryViewItemSubitleWind())
                
                DailySumarryItemView(iconSize: iconSize,
                                     image: R.image.humidityImage()!,
                                     title: viewModel.humidity,
                                     subtitle: R.string.texts.weatherTaskSwiftUIDailySummaryViewItemSubitleHumidity())
                
                DailySumarryItemView(iconSize: iconSize,
                                     image: R.image.visibilityImage()!,
                                     title: viewModel.visibility,
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
