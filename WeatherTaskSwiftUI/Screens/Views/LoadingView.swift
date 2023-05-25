//
//  LoadingView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
