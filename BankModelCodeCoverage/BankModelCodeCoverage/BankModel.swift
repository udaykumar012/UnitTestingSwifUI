//
//  BankModel.swift
//  BankModelCodeCoverage
//
//  Created by Uday Kumar Kotla on 27/06/23.
//

import Foundation
enum BankError:Error{
    case LowBalanceError
}

class BankModel{
    var banckaccNum : String
    var balance : Int
    init(banckaccNum : String,balance : Int){
        self.balance = balance
        self.banckaccNum = banckaccNum
    }
    func deposit(amt:Int){
        self.balance+=amt
    }
    func withdraw(amt:Int) throws {
        if(self.balance<amt){
            throw BankError.LowBalanceError
        }
        self.balance-=amt
    }
}
