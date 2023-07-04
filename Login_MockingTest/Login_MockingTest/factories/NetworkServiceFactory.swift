//
//  NetworkServiceFactory.swift
//  Login_MockingTest
//
//  Created by Uday Kumar Kotla on 04/07/23.
//

import Foundation
//import Login_MockingTestUITests
class NetworkServiceFactory{
    static func create()->NetworkService{
        let env = ProcessInfo.processInfo.environment["ENV"]
        //env during testing
        if let Myenv = env{
            if Myenv == "TEST"{
                return MockWebService()
                
            }
            return Webservice()
        }
        return Webservice()
    }
}
