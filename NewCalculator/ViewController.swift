//
//  ViewController.swift
//  NewCalculator
//
//  Created by Raza Rauf on 2016-05-18.
//  Copyright © 2016 Raza Rauf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // created a property
    // "!" and "?" also means optional
    // implicitly unwrapping the optional
    @IBOutlet private weak var display: UILabel!
    
    private var userEnteringNumbers = false
    
    // created a method
    @IBAction private func touchDigit(sender: UIButton)
    {
        // sender.currentTitle is of type optional with string as its associated value
        // use sender.currentTitle!, to unwrap the associated type out of the optional
        // if the value of the optional is not set and you unwrap it with "!" - app crashes
        let digit = sender.currentTitle!
        
        if userEnteringNumbers
        {
            // display! is unwrapped UILabel type
            // text is also an optional - unwrapping that as well
            let textCurrentlyInDisplay = display.text!
            
            display.text = textCurrentlyInDisplay + digit
            
            // print ("\(digit) is touching me!")
        }
        else
        {
            display.text = digit
        }
        
        // user now in the middle of type because he/she touched a digit
        userEnteringNumbers = true
    }
    
    
    private var textOnScreen : Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
    
    
    private var calcBrain = CalculatorBrain()

    @IBAction private func operationButton(sender: UIButton) {
        if userEnteringNumbers {
            calcBrain.setOperand(textOnScreen)
            userEnteringNumbers = false
        }
        
        // put an if let so the label is allowed to empty
        // only "unwrap" when sender.currentTitle is set
        if let mathematicalSymbol = sender.currentTitle {
            calcBrain.performOperation(mathematicalSymbol)
        }
        
        textOnScreen = calcBrain.result
    }
}




















