//
//  DayViewCell.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 29.05.2023.
//

import SwiftUI

struct DayViewCell: View {
    var text: String
    var width: CGFloat
    var height: CGFloat
    var textSize: CGFloat
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                DateView(myText: "April")
                HourlyWeatherInformationView()
            }
            .padding(.leading, 16)
            .padding(.bottom, 10)
            HourlyTemperatureView(textSize: textSize)
        }
        .frame(maxWidth: width, minHeight: height)
        .background(Color(R.color.bgSunnyColor()!))
    }
}

//struct DayViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        DayViewCell(text: "a", width: .infinity, height: 310)
//    }
//}
