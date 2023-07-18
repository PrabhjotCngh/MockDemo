//
//  ContentView.swift
//  MockDemo
//
//  Created by M_2195552 on 2023-07-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginVM = LoginViewModel(service: Webservice())
    @State private var message: String = ""
    
    var errorMessage: String {
        switch loginVM.loginStatus {
        case .denied:
            return "Invalid credentials"
        case .validationFailed:
            return "Required fields are missing"
        default:
            return ""
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("User name", text: $loginVM.username)
                        .accessibilityIdentifier("usernameTextField")
                    
                    TextField("Password", text: $loginVM.password)
                        .accessibilityIdentifier("passwordTextField")
                    
                    HStack {
                        Spacer()
                        Button {
                            loginVM.login()
                        } label: {
                            Text("Login")
                                .accessibilityIdentifier("loginButton")
                        }
                        Spacer()
                    } //: HStack
                } //: Form
                
                Text(errorMessage)
                    .accessibilityIdentifier("messageText")
                
                NavigationLink(isActive: .constant(loginVM.loginStatus == .authenticated)) {
                    DashboardView()
                } label: {
                    EmptyView()
                }
            } //: VStack
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
