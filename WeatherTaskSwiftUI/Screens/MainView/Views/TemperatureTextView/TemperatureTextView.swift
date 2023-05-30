//
//  TemperatureTextView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct TemperatureTextView: View {
    @Binding var viewModel: TemperatureTextViewModel
    var textSize: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
//                Text(viewModel.temperature)
//                    .font(Font(R.font.interSemiBold(size: textSize) ?? .systemFont(ofSize: textSize, weight: .semibold)))
            }
        }
    }
}
