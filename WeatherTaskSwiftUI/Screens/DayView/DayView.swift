//
//  DayView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DayView: View {
//    @StateObject var viewModel: DayViewModel
    var array = ["a", "b", "c", "d", "v", "g"]
    
    var body: some View {
        GeometryReader { proxy in
            VStack() {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(0..<array.count, id: \.self) { index in
                            DayViewCell(text: array[index], width: .infinity, height: proxy.size.height / 6, textSize: proxy.size.height / 100 * 7.6)
                        }
                    }
                }
            }
        }
    }
}

//struct DayView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayView()
//    }
//}
