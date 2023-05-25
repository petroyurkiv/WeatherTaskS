//
//  Extension+Font.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

extension Font {
    static var myTitle: Font {
        Font.custom("Inter-SemiBold", size: 32)
    }
    
    static var mySubtitle: Font {
        Font.custom("Inter-Medium", size: 20)
    }
    
    static var myParagraphText: Font {
        Font.custom("Inter-Medium", size: 18)
    }
    
    static var myDescriptionText: Font {
        Font.custom("Inter-Medium", size: 16)
    }
}
