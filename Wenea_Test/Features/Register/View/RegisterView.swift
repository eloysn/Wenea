//
//  RegisterView.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var store: RegisterStore
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            if store.state.userRegister {
                MapView(store: MapStore(mapUseCase: DomainContainerDIImpl.shared.mapUseCase))
            } else {
                Color(.background)
                    .ignoresSafeArea()
                VStack() {
                    Image("logo-app")
                        .resizable()
                        .scaledToFit().frame(width: 200)
                        .padding(.bottom)
                    TextField("Name", text: $name)
                        .textFieldStyle(OutlinedTextFieldStyle())
                        .padding(.bottom)
                    TextField("Email", text: $email)
                        .textFieldStyle(OutlinedTextFieldStyle())
                        .padding(.bottom)
                    SecureField("Password", text: $password)
                        .textFieldStyle(OutlinedTextFieldStyle())
                        .padding(.bottom)
                    Button {
                        store.dispatch(action: .onRegister(
                            user: User(
                                name: name,
                                email: email,
                                password: password)))
                    } label: {
                        loadingBuilder()
                    }
                    .padding(.bottom)
                    .buttonStyle(PrimaryButtonStyle())
                    errorBuilder()
                }.padding(.horizontal)
            }
        }.navigationBarBackButtonHidden(store.state.userRegister)
    }
    @ViewBuilder
    private func loadingBuilder() -> some View {
        if store.state.loading {
            ProgressView().tint(Color.white)
        } else {
            Text("Register")
        }
    }
    @ViewBuilder
    private func errorBuilder() -> some View {
        if !(store.state.messageError?.isEmpty ?? false) {
            Text("\(store.state.messageError ?? "")")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(
            store: RegisterStore(registerUseCase: DomainContainerDIImpl.shared.registerUseCase)
        )
    }
}
