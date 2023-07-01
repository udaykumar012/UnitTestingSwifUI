//
//  WebService.swift
//  Login_MockingTest
//
//  Created by Uday Kumar Kotla on 29/06/23.
//

import Foundation
enum NetworkError: Error {
    case badRequest
    case decodingError
    case notAuthenticated
}

class Webservice {
    
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        let url = URL(string: "http://localhost:3000/login")!
        
        let data = ["username": username, "password": password]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(data)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil,
                  (response as? HTTPURLResponse)?.statusCode == 200 else {
                      completion(.failure(.badRequest))
                      return
                  }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            if loginResponse.success {
                completion(.success(()))
            } else {
                completion(.failure(.notAuthenticated))
            }
            
        }.resume()
    }
    
}
