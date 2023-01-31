//
//  PrimaryButtonStyle.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    @State var color: Color = .primaryColor
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(12)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                        .cornerRadius(12)
                }
            }
    }
}
