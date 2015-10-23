//
//  ViewController.swift
//  Calculator
//
//  Created by Raghav Apoorv on 23/10/15.
//  Copyright (c) 2015 Roalts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var display : UILabel!
    
    var userIsEnteringNumbers = false
    
    @IBAction func enterNumber(sender : UIButton) {
        let digit = sender.currentTitle!
        
        if userIsEnteringNumbers {
            display.text = display.text! + digit
        } else {
            display.text = digit
            
            userIsEnteringNumbers = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsEnteringNumbers = false
        operandStack.append(displayValue)
        
        println("operandStack = \(operandStack)")
        
    }

    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        } set {
            display.text = "\(newValue)"
            userIsEnteringNumbers = false
        }
        
        }
    
    @IBAction func clear() {
        displayValue = 0
        display.text = "\(displayValue)"
    }
    
    }
