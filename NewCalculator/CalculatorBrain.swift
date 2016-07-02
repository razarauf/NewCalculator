//
//  CalculatorBrain.swift
//  NewCalculator
//
//  Created by Raza Rauf on 2016-07-01.
//  Copyright © 2016 Raza Rauf. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand (operand: Double) {
        accumulator = operand
    }
    
    func performOperation (mathematicalSymbol: String) {
        if mathematicalSymbol == "π" {
            accumulator = M_PI
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
}