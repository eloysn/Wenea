//
//  RegisterView.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @Binding var isRegister: Bool
    
    var body: some View {
        ZStack {
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
                TextField("Password", text: $password)
                    .textFieldStyle(OutlinedTextFieldStyle())
                    .padding(.bottom)
                Button {
                    //store.dispatch(action: .onLogin(user: User(email: email, password: password)))
                    isRegister = false
                } label: {
                    Text("Register")
                }
                .padding(.bottom)
                .buttonStyle(PrimaryButtonStyle())
            }.padding(.horizontal)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isRegister: .constant(false))
    }
}
