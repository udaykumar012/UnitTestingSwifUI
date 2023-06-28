//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Uday Kumar Kotla on 27/06/23.
//

import Foundation
import XCTest

class ContentViewPage{
    var app : XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    var totalTextField :XCUIElement{ app.textFields["total_text_field"]
    }
    var tipPercentageSegmentedControl : XCUIElement{ app.segmentedControls["tipPercentageSegmented"]
    }
    var calculateTipButoon :XCUIElement{ app.buttons["calculate_Tip_button"]
    }
    var tipValue :XCUIElement{ app.staticTexts["tip_value"]
    }
    var message :XCUIElement{ app.staticTexts["Message_Text"]
    }
    
}
