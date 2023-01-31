//
//  LoginView.swift
//  Wenea_Test
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var store: LoginStore
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingRegister = false
    private let registerUseCase = DomainContainerDIImpl.shared.registerUseCase
    
    var body: some View {
        if store.state.userLoged {
            MapView(store: MapStore(mapUseCase: DomainContainerDIImpl.shared.mapUseCase))
        } else {
            NavigationView {
                ZStack {
                    Color(.background)
                        .ignoresSafeArea()
                    VStack() {
                        Image("logo-app")
                            .resizable()
                            .scaledToFit().frame(width: 200)
                            .padding(.bottom)
                        TextField("Email", text: $email)
                            .textFieldStyle(OutlinedTextFieldStyle())
                            .padding(.bottom)
                        SecureField("Password", text: $password)
                            .textFieldStyle(OutlinedTextFieldStyle())
                            .padding(.bottom)
                        Button {
                            store.dispatch(action: .onLogin(email: email, pass: password))
                        } label: {
                            loadingBuilder()
                        }
                        .padding(.bottom)
                        .buttonStyle(PrimaryButtonStyle())
                        NavigationLink(
                            destination:
                                RegisterView(store: RegisterStore(registerUseCase: registerUseCase)),
                            isActive: $isShowingRegister
                        ) {
                            Button {
                                self.isShowingRegister = true
                            } label: {
                                Text("Register")
                            }
                            .padding(.bottom)
                            .buttonStyle(PlainButtonStyle())
                        }
                        errorBuilder()
                    }.padding(.horizontal)
                }
            }.accentColor(.primaryColor)
        }
    }
    
    @ViewBuilder
    private func loadingBuilder() -> some View {
        if store.state.loading {
            ProgressView().tint(Color.white)
        } else {
            Text("Log in")
        }
    }
    @ViewBuilder
    private func errorBuilder() -> some View {
        if !(store.state.messageError?.isEmpty ?? false) {
            Text("\(store.state.messageError ?? "")")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(store: LoginStore(loginUseCase: DomainContainerDIImpl.shared.loginUseCase))
    }
}
