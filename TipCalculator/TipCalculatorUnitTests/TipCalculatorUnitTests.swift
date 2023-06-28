//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Uday Kumar Kotla on 24/06/23.
//

import XCTest

class when_calculating_tip_based_on_total_amount: XCTestCase {
 
    func test_should_calculating_tip_successfully(){
        let tipCalclator = TipCalculator()
        let tip = try! tipCalclator.calculate(total:102,tipPercentage:0.2)
        XCTAssertEqual(20.4, tip)
    }
    
//    func test_add_two_numbers(){
//        let result = 3+5
//        XCTAssertEqual(result, 8,"test results 8")
//    }
    
}


class when_calculating_tip_based_on_negative_total_amount: XCTestCase {
    
    func test_should_throw_invalid_input_exception(){
        let tipCalclator = TipCalculator()
        
        XCTAssertThrowsError(try tipCalclator.calculate(total:-102,tipPercentage:0.2),"Invalid Input") { error in
            XCTAssertEqual(error as! TipCalculatorErrors, TipCalculatorErrors.invalidInput)
        }
    }
}
