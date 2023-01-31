//
//  PlainButtonStyle.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import SwiftUI

struct PlainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: 108, maxHeight: 34, alignment: .center)
            .contentShape(Rectangle())
            .foregroundColor(configuration.isPressed ? Color.primaryColor.opacity(0.5) : Color.primaryColor)
    }
}
