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
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    func test_shoud_display_error_message_mushHaveRequriedFields(){
       
        let usr_name = app.textFields["usernameTextField"]
        usr_name.tap()
        usr_name.typeText("")
        let pwd = app.textFields["passwordTextField"]
        pwd.tap()
        pwd.typeText("")
        let login_btn = app.buttons["loginButton"]
        login_btn.tap()
        let err_msg = app.staticTexts["messageText"]
        XCTAssertEqual("Required fields are missing",err_msg.label)
    }
    func test_should_navigate_to_dashboardView_when_authenticated(){
        let usr_name = app.textFields["usernameTextField"]
        usr_name.tap()
        usr_name.typeText("udayhrudai")
        let pwd = app.textFields["passwordTextField"]
        pwd.tap()
        pwd.typeText("password")
        let login_btn = app.buttons["loginButton"]
        login_btn.tap()
        let dashboardNavTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavTitle.waitForExistence(timeout: 0.5))
    }
    func test_scr(){
        
    }
}
