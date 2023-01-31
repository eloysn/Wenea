//
//  LoadingView.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                content()
                    .blur(radius: isShowing ? 2 : 0)
                if isShowing {
                    Rectangle()
                        .fill(Color.black).opacity(isShowing ? 0.6 : 0)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 48) {
                        ProgressView().scaleEffect(2.0, anchor: .center)
                        Text("Loading...").font(.title2).fontWeight(.semibold)
                    }
                    .frame(width: 200, height: 200)
                    .background(Color.white)
                    .foregroundColor(Color.primary)
                    .cornerRadius(16)
                }
            }
        }
    }
}
