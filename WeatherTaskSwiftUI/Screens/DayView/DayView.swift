//
//  DayView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DayView: View {
    
@State var dayViewModel: DayViewModel
    
    var body: some View {
        GeometryReader { proxy in
            VStack() {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        Text(dayViewModel.dateLabel)
                                    
                        ForEach(dayViewModel.list) {
                            Text($0.visibilityLabel)
                            Text($0.windLabel)
                        }
                    }
                }
                
            }
        }
    }
}

