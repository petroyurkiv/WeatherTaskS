//
//  DateView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DateView: View {
    var myText: String
    
    var body: some View {
        Text(myText)
            .font(Font(R.font.interMedium(size: 18)!))
            .padding(.top, 12)
            .padding(.bottom, 20)
    }
}

