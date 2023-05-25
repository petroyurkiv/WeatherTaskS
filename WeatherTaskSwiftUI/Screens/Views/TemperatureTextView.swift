//
//  TemperatureTextView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct TemperatureTextView: View {
    var textSize: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                Text("17")
                    .font(.custom("Inter-SemiBold", size: textSize))
            }
        }
    }
}
