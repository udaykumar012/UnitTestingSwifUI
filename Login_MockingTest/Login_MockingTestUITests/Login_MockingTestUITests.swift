//
//  Login_MockingTestUITests.swift
//  Login_MockingTestUITests
//
//  Created by Uday Kumar Kotla on 30/06/23.
//

import XCTest

@testable import Login_MockingTest

final class when_user_clicks_on_login_button: XCTestCase {
    private var app : XCUIApplication!
    private var loginPage : LoginPageObject!
    override func setUp() {
        app = XCUIApplication()
        loginPage = LoginPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV":"TEST"]
        app.launch()
    }
    func test_shoud_display_error_message_mushHaveRequriedFields(){
       
        loginPage.usernameTextField.tap()
        loginPage.usernameTextField.typeText("")
        
        loginPage.passwordTextField.tap()
        loginPage.passwordTextField.typeText("")
        
        loginPage.loginButton.tap()
        
        XCTAssertEqual("Required fields are missing",loginPage.errorMessage.label)
    }
    func test_should_navigate_to_dashboardView_when_authenticated(){
        loginPage.usernameTextField.tap()
        loginPage.usernameTextField.typeText("admin")
        
        loginPage.passwordTextField.tap()
        loginPage.passwordTextField.typeText("password")
        
        loginPage.loginButton.tap()
        let dashboardNavTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavTitle.waitForExistence(timeout: 0.5))
    }
    func test_should_dispaly_error_message_for_InvalidCredentials(){
        loginPage.usernameTextField.tap()
        loginPage.usernameTextField.typeText("wrongAdmin")
        
        loginPage.passwordTextField.tap()
        loginPage.passwordTextField.typeText("password")
        
        loginPage.loginButton.tap()
        XCTAssertEqual("Invalid credentials",loginPage.errorMessage.label)
    }
}
