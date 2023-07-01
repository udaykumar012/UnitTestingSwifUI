//
//  LoginViewModel.swift
//  Login_MockingTest
//
//  Created by Uday Kumar Kotla on 29/06/23.
//

import Foundation

enum LoginStatus {
    case none
    case authenticated
    case denied
    case validationFailed
}

class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginStatus: LoginStatus = .none
    
    private var service: Webservice
    
    init(service: Webservice) {
        self.service = service
    }
    
    func login() {
        
        if username.isEmpty || password.isEmpty {
            self.loginStatus = .validationFailed
            return
        }
        
        service.login(username: username, password: password) { result in
            switch result {
                case .success():
                        DispatchQueue.main.async {
                            self.loginStatus = .authenticated
                        }
                case .failure(_):
                    DispatchQueue.main.async {
                        self.loginStatus = .denied
                    }
            }
        }
    }
    
}
