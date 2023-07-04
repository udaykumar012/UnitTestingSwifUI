//
//  ContentView.swift
//  Login_MockingTest
//
//  Created by Uday Kumar Kotla on 29/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var loginVM = LoginViewModel(service: NetworkServiceFactory.create())
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
        
        let _ = Self._printChanges()
        
        NavigationView {
            
            VStack {
                
                if(loginVM.loginStatus == .authenticated) {
                    DashboardView()
                }
                else{
                    Form {
                        TextField("User name", text: $loginVM.username)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        
                            .accessibilityIdentifier("usernameTextField")
                        
                        TextField("Password", text: $loginVM.password)
                            .autocapitalization(.none)
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
                        }
                        
                        Text(errorMessage)
                            .accessibilityIdentifier("messageText")
                    }
                }
                
                
            }
            .navigationTitle("Login")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
