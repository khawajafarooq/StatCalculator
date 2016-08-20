//
//  ViewController.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var displayValue: UILabel!
    
    @IBOutlet weak var quartileButton: UIButton!
    @IBOutlet weak var stdDevButton: UIButton!
    @IBOutlet weak var medianButton: UIButton!
    @IBOutlet weak var sumButton: UIButton!
    @IBOutlet weak var meanButton: UIButton!
    @IBOutlet weak var varianceButton: UIButton!
    @IBOutlet weak var meanOfSquaresButton: UIButton!
    var userInTheMiddleOfTypingNumber: Bool = false
    
    var calculator = StatCalculator()
    
    var enteredValue: Double? {
        
        get {
            
            let displayNum = NSNumberFormatter().numberFromString(displayValue.text!)!.doubleValue
            return displayNum.isNaN ? nil : displayNum
        }
        set {
            
            if newValue == nil {
                displayValue.text = "0"
            }
            else {
                displayValue.text = "\(newValue!)"
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // register notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(refreshOperandStack(_:)), name: Constants.NotificationKey.DeleteItem, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(refreshData(_:)), name: Constants.NotificationKey.RefreshData, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(clearData), name: Constants.NotificationKey.ClearData, object: nil)
    }
    
    // MARK: Notification methods
    func refreshOperandStack(notification: NSNotification) {
        if let data = notification.object as! NSDictionary! {
            
            let index: Int = (data.valueForKey(Constants.GNRC.ItemIndex)?.integerValue)!
            calculator.removeOperandAtIndex(index)
        }
        
    }
    
    func refreshData(notification: NSNotification) {
        if let data = notification.object as! NSDictionary! {
            
            let dataArray: Array<Double> = (data.valueForKey(Constants.GNRC.DataItem)) as! Array<Double>
            calculator.operandStack = dataArray
        }
    }
    
    func clearData() {
        // clear the stack
        calculator.clearAllOperand()
    }
    
    // MARK: Event Handlers
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "NumberList") {
            //get a reference to the destination view controller
            let destinationVC:NumberTableViewController = segue.destinationViewController as! NumberTableViewController
            destinationVC.data = calculator.operandStack
        }
    }
    
    func chartClicked() {
        
    }
    
    @IBAction func numberClicked(sender: UIButton) {
        
        numberEntered(sender.currentTitle!)
    }
    
    @IBAction func enterClicked() {
        
        if !(displayValue.text?.isEmpty)! {
            userInTheMiddleOfTypingNumber = false
            calculator.pushOperand(enteredValue!)
            clearText()
        }
    }
    
    @IBAction func clearClicked(sender: AnyObject) {
        
        userInTheMiddleOfTypingNumber = false
        clearText()
    }
    
    @IBAction func backClicked(sender: AnyObject) {
        
        if displayValue.text! != "0" {
            
            if let valueToDisplay = String(displayValue.text!.characters.dropLast()) as String? {
                
                if valueToDisplay.isEmpty {
                    userInTheMiddleOfTypingNumber = false
                    displayValue.text! = "0"
                }
                else {
                    displayValue.text! = valueToDisplay
                }
            }
        }
    }
    
    @IBAction func operationClicked(sender: UIButton) {
        
        switch sender {
        case sumButton:
            let result = calculator.evaluate(Constants.Operation.Sum.rawValue)
            enteredValue = result
            
        case meanButton:
            let result = calculator.evaluate(Constants.Operation.Mean.rawValue)
            enteredValue = result
            
        case meanOfSquaresButton:
            let result = calculator.evaluate(Constants.Operation.MeanOfSquaredSum.rawValue)
            enteredValue = result
            
        case varianceButton:
            let result = calculator.evaluate(Constants.Operation.Variance.rawValue)
            enteredValue = result
            
        case medianButton:
            let result = calculator.evaluate(Constants.Operation.Median.rawValue)
            enteredValue = result
            
        case stdDevButton:
            let result = calculator.evaluate(Constants.Operation.StdDeviation.rawValue)
            enteredValue = result
            
        case quartileButton:
            let result = calculator.evaluate(Constants.Operation.Quartile.rawValue)
            enteredValue = result
            
        default: break
            
        }
        
    }
    
    //MARK: Helper Methods
    func clearText()  {
        enteredValue = nil
    }
    
    func numberEntered(number: String) {
        
        if userInTheMiddleOfTypingNumber {
            
            if number == "0" && displayValue.text! != "0" {
                displayValue.text = displayValue.text! + number
            }
            else if number != "0" {
                displayValue.text = displayValue.text! + number
            }
        }
        else if number != "0" {
            
            displayValue.text = number
            userInTheMiddleOfTypingNumber = true
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

