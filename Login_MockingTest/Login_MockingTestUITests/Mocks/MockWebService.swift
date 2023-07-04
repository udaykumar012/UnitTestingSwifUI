//
//  MockWebService.swift
//  Login_MockingTestUITests
//
//  Created by Uday Kumar Kotla on 03/07/23.
//

import Foundation
@testable import Login_MockingTest

class MockWebService : NetworkService{
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        if(username == "admin" && password == "password"){
            completion(.success(()))
        }else{
            completion(.failure(NetworkError.notAuthenticated))
        }
    }
    
}
