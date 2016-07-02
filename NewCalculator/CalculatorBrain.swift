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
    
    private var saveBinOp : saveBinOpStruct?
    
    private var lookUp : Dictionary <String, typesOfOperations> = [
        "π" : typesOfOperations.constant (M_PI),
        "e" : typesOfOperations.constant (M_E),
        "√" : typesOfOperations.unaryOp (sqrt),
        "x" : typesOfOperations.binaryOp ({$0 * $1}),
        "÷" : typesOfOperations.binaryOp ({$0 / $1}),
        "+" : typesOfOperations.binaryOp ({$0 + $1}),
        "-" : typesOfOperations.binaryOp ({$0 - $1}),
        "=" : typesOfOperations.equal
    ]
    
    private enum typesOfOperations  {
        case constant (Double)
        case unaryOp ((Double) -> Double)
        case binaryOp ((Double, Double) -> Double)
        case equal
    }
    
    private struct saveBinOpStruct {
        var binaryFunc: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    func setOperand (operand: Double) {
        accumulator = operand
    }
    
    func performOperation (operations: String) {
        if let operation = lookUp[operations] {
            switch operation {
            case .constant (let value):
                accumulator = value
            case .unaryOp (let function):
                accumulator = function (accumulator)
            case .binaryOp (let function):
                executeOp()
                saveBinOp = saveBinOpStruct (binaryFunc: function, firstOperand: accumulator)
            case .equal:
                executeOp()
            }
        }
    }
    
    private func executeOp (){
        if saveBinOp != nil {
            accumulator = saveBinOp!.binaryFunc(saveBinOp!.firstOperand, accumulator)
            saveBinOp = nil
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
}