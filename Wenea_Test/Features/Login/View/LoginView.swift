//
//  LoginView.swift
//  Wenea_Test
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack() {
                contentBuilder()
                Image("logo-app")
                    .resizable()
                    .scaledToFit().frame(width: 200)
                TextField("Intoduce ti nombre", text: $email)
                    .background(Color.white)
                TextField("Introduce ti nombre", text: $password)
                    .background(Color.white)
                Button {
                    loginViewModel.send(event: .onLogin(user: User(email: "", password: "")))
                } label: {
                    Text("Log in")
                }
                Button {
                    
                } label: {
                    Text("Register")
                }
            }
        }
    }
    
    @ViewBuilder
    func contentBuilder() -> some View {
        switch loginViewModel.state {
        case .loged: Color.yellow
        default: Text("Heyyyy")
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(loginViewModel: LoginViewModel(loginUseCase: DomainContainerDIImplMock.shared))
//    }
//}
