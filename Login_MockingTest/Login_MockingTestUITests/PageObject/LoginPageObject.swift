//
//  LoginPage.swift
//  Login_MockingTestUITests
//
//  Created by Uday Kumar Kotla on 04/07/23.
//

import Foundation

import XCTest
class LoginPageObject {
    private var app : XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var usernameTextField : XCUIElement{
        app.textFields["usernameTextField"]
    }
    var passwordTextField : XCUIElement {
        app.textFields["passwordTextField"]
    }
    var loginButton : XCUIElement{
        app.buttons["loginButton"]
    }
    var errorMessage : XCUIElement{
        app.staticTexts["messageText"]
    }
}
