//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Uday Kumar Kotla on 24/06/23.
//

import Foundation
enum TipCalculatorErrors:String, Error{
    case invalidInput
}

class TipCalculator{
    init(){
        
    }
    func calculate(total:Double,tipPercentage:Double) throws ->Double{
        if (total<0){
            throw TipCalculatorErrors.invalidInput
        }
        var res = total*tipPercentage
        res = round(res*100)/100.0
        return res
    }
}
