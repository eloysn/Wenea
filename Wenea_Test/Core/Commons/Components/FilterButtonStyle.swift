//
//  FilterButtonStyle.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import SwiftUI

struct FilterButtonStyle: ButtonStyle {
    
    @State var color: Color = .black
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            Image(systemName: "slider.horizontal.3")
                .font(.system(size: 40))
                .foregroundColor(color)
            Text("Filters").foregroundColor(color)
        }
        .padding(.horizontal)
            
    }
}
