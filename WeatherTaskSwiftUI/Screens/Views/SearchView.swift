//
//  SearchView.swift
//  WeatherTaskSwiftUI
//
//  Created by Petro on 25.05.2023.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Search")
                .font(.mySubtitle)
                .padding(.leading)
            HStack {
                TextField("New York", text: $text)
                    .font(.myDescriptionText)
            }
            .padding(8.0)
            .overlay(RoundedRectangle(cornerRadius: 24.0)
                .stroke(.black, lineWidth: 4))
            .padding(.horizontal, 16.0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
