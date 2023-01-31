//
//  PrimaryButtonStyle.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {

    @State var color: Color = .indigo

    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.title.bold())
            .padding()
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
