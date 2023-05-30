//
//  ShortInformationView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct ShortInformationView: View {
    @Binding var viewModel: ShortInformationViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.city)
                .bold()
                .font(Font(R.font.interSemiBold(size: 32.0) ?? .systemFont(ofSize: 32.0, weight: .semibold)))
            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                .font(Font(R.font.interMedium(size: 16.0) ?? .systemFont(ofSize: 16.0, weight: .medium)))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 16.0)
        .padding(.top, 16.0)
    }
}
