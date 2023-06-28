//
//  BankModelCodeCoverageTests.swift
//  BankModelCodeCoverageTests
//
//  Created by Uday Kumar Kotla on 27/06/23.
//

import XCTest
@testable import BankModelCodeCoverage
class BankModel_deposit_test: XCTestCase {
    func test_check_amt_after_deposit(){
        let bank = BankModel(banckaccNum: "1ae2", balance: 1000)
        bank.deposit(amt: 500)
        XCTAssertEqual(bank.balance, 1500)
    }
}

class BankModel_withdrawn_test: XCTestCase {
    func test_check_amt_after_withdrawn_valid_Amt(){
        let bank = BankModel(banckaccNum: "1ae2", balance: 1000)
        try! bank.withdraw(amt: 500)
        XCTAssertEqual(bank.balance, 500)
    }
    func test_check_amt_after_withdrawn_Invalid_Amt(){
        let bank = BankModel(banckaccNum: "1ae2", balance: 1000)
        XCTAssertThrowsError(try bank.withdraw(amt: 1500), "") { error in
            XCTAssertEqual(error as! BankError, BankError.LowBalanceError)
        }
    }
}
