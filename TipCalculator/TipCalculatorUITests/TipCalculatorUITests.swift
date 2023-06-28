//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Uday Kumar Kotla on 24/06/23.
//


import XCTest

final class when_contentView_is_shown: XCTestCase {
    //steps
    private var app : XCUIApplication = XCUIApplication()
    private var contentViewPage:ContentViewPage!
    override func setUp() {
        self.app = XCUIApplication()
        contentViewPage=ContentViewPage(app: self.app)
        continueAfterFailure = false
        self.app.launch()
    }
    
    func test_should_make_sure_the_total_text_field_contains_default_value(){
        
        //let totalTextField = app.textFields["total_text_field"]
        //total_text_field is name of accessibilityIdentifet of texfield
        XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
    }
    func test_should_make_sure_20_percent_default_tip_option_selected(){
        
//        let tipPercentageSegmentedControl = app.segmentedControls["tipPercentageSegmented"]
        let segmentedControlButton = contentViewPage.tipPercentageSegmentedControl.buttons.element(boundBy: 1) // finds the button at index 1
        XCTAssertEqual(segmentedControlButton.label, "20%") // checks label of button
        XCTAssertTrue(segmentedControlButton.isSelected) //checks button selected or not
        
    }
    override func tearDown() {
        //cleanup
    }
}

class when_claculate_button_tip_pressed_for_ValidInput:XCTestCase{
    //steps
    private var app : XCUIApplication = XCUIApplication()
    private var contentViewPage : ContentViewPage!
    override func setUp() {
        self.app = XCUIApplication()
        contentViewPage=ContentViewPage(app: app)
        continueAfterFailure = false
        self.app.launch()
        //class abt calculate button press so we need that button
       // let totalTextField = app.textFields["total_text_field"] //get access to total text field
        contentViewPage.totalTextField.tap() // the field get activated
        contentViewPage.totalTextField.typeText("200")// types value
        let calculateTipButoon = app.buttons["calculate_Tip_button"]
        calculateTipButoon.tap()
        
    }
    func test_tip_label_for_valid_Inputs(){
        //let tipValue = app.staticTexts["tip_value"]
        let _ = contentViewPage.tipValue.waitForExistence(timeout: 0.5)//say wait for 5 sec before existence
        XCTAssertEqual(contentViewPage.tipValue.label, "$40.00")
    }
}

class when_claculate_button_tip_pressed_for_InvalidInput:XCTestCase{
    private var app : XCUIApplication = XCUIApplication()
    private var contentViewPage : ContentViewPage!
    override func setUp() {
        self.app = XCUIApplication()
        contentViewPage=ContentViewPage(app: app)
        continueAfterFailure = false
        self.app.launch()
        //class abt calculate button press so we need that button
        //let totalTextField = app.textFields["total_text_field"] //get access to total text field
        contentViewPage.totalTextField.tap() // the field get activated
        contentViewPage.totalTextField.typeText("-200")// types value
        //let calculateTipButoon = app.buttons["calculate_Tip_button"]
            contentViewPage.calculateTipButoon.tap()
        
    }
    func test_tip_label_for_Invalid_Inputs(){
        
       // let tipValue = app.staticTexts["tip_value"]
        let _ = contentViewPage.tipValue.waitForExistence(timeout: 0.5)//say wait for 5 sec before existence
        XCTAssertEqual(contentViewPage.tipValue.label, "")
    }
    func test_should_display_error_message_for_InvalidInput(){
        let _ = contentViewPage.message.waitForExistence(timeout: 0.5)
        XCTAssertEqual(contentViewPage.message.label, "Invalid Input")
    }
}

//using recording tool
class writing_test_using_recording_tool:XCTestCase{
    func test_tip_label_for_valid_Inputs_using_recording_tool(){
        
        let app = XCUIApplication()
        app.launch()//m
        app.textFields["total_text_field"].tap()
        app.textFields["total_text_field"].typeText("100")
        app.buttons["30%"].tap()
        app.buttons["calculate_Tip_button"].tap()
        let tipValue = app.staticTexts["tip_value"]
        XCTAssertEqual( tipValue.label,"$30.00")
        
    }
}
