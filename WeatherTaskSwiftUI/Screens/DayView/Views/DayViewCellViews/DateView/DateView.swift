//
//  DateView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DateView: View {
    var dateText: String
    
    var body: some View {
        Text(dateText)
            .font(Font(R.font.interSemiBold(size: 18.0) ?? .systemFont(ofSize: 18.0, weight: .medium)))
            .padding(.top, 8.0)
            .padding(.bottom, 4.0)
    }
}

