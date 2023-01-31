//
//  OutlinedTextFieldStyle.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import SwiftUI

struct OutlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 2)
            }
    }
}

