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
    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTyping = false
    
    // created a method
    @IBAction func touchDigit(sender: UIButton)
    {
        // sender.currentTitle is of type optional with string as its associated value
        // use sender.currentTitle!, to unwrap the associated type out of the optional
        // if the value of the optional is not set and you unwrap it with "!" - app crashes
        let digit = sender.currentTitle!
        
        if userInTheMiddleOfTyping
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
        userInTheMiddleOfTyping = true
    }

    @IBAction func operationButton(sender: UIButton) {
        userInTheMiddleOfTyping = false
        // put an if let so the label is allowed to empty
        // only "unwrap" when sender.currentTitle is set
        if let mathematicalSymbol = sender.currentTitle {
            if mathematicalSymbol == "π" {
                display.text = String (M_PI)
            }
        }
        
    }
}




















