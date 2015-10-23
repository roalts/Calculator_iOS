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
    
    @IBAction func operate (sender : UIButton) {
        let operation = sender.currentTitle!
        if userIsEnteringNumbers {
            enter()
        }
        
        switch(operation) {
        case "+" : performOperation(add)
        case "-" : performOperation(subtract)
        case "*" : performOperation(multiply)
        case "/" : performOperation(divide)
        default : break
            
        }
    }
    
    func performOperation (operation : (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation (operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
        
    }
    
    func add(op1 : Double, op2 : Double) -> Double {
        return op1 + op2
    }
    
    func subtract(op1 : Double, op2 : Double) -> Double {
        return op1 - op2
    }
    
    func multiply(op1 : Double, op2 : Double) -> Double {
        return op1 * op2
    }
    
    func divide(op1 : Double, op2 : Double) -> Double {
        return op1 / op2
    }
    
}
