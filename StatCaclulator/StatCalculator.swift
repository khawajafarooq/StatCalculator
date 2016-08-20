//
//  StatCalculator.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import Foundation

class StatCalculator: NSObject {
    
    var operandStack = Array<Double>()
    
    enum Operation: String {
        
        case Sum = "1"
        case Mean = "2"
        case MeanOfSquaredSum = "3"
        case Variance = "4"
        case StdDeviation = "5"
        case Median = "6"
        case Quartile = "7"
    }
    
    func pushOperand(operand: Double) {
        
        operandStack.append(operand)
    }
    
    func clearAllOperand() {
        if !operandStack.isEmpty {
            operandStack.removeAll()
        }
    }
    
    func removeOperandAtIndex(index: Int) {
        if !operandStack.isEmpty && index < operandStack.count {
            
            // Deleting operand from stack
            operandStack.removeAtIndex(index)
        }
    }
    
    func evaluate(Op: String) -> Double? {
        if !operandStack.isEmpty {
            
            switch Op {
            case Operation.Sum.rawValue:
                return getSum(operandStack)
                
            case Operation.Mean.rawValue:
                return getMean(operandStack)
                
            case Operation.MeanOfSquaredSum.rawValue:
                return getMeanSquaredSum(operandStack)
                
            case Operation.Variance.rawValue:
                return getVariance(operandStack)
                
            case Operation.StdDeviation.rawValue:
                return getStdDev(operandStack)
                
            case Operation.Median.rawValue:
                return getMedian(operandStack)
                
            case Operation.Quartile.rawValue:
                return getQuartile(operandStack)
                
            default:
                return 0
            }
        }
        return 0
    }
    
    // MARK: Computation Methods
    func getMeanSquaredSum(array: Array<Double>) -> Double {
        
        var result = Array<Double>()
        for index in 0..<operandStack.count {
            let number = operandStack[index]
            result.append(number*number)
        }
        
        return getMean(result).roundToPlaces(2)
    }
    
    func getSum(array: Array<Double>) -> Double {
        return array.reduce(0, combine: +)
    }
    
    func getMean(array: Array<Double>) -> Double {
        return (getSum(array) / Double(array.count)).roundToPlaces(2)
    }
    
    func getVariance(array: Array<Double>) -> Double {
        let mean = getMean(array)
        var temp: Double = 0;
        for val in array {
            temp += (mean - val) * (mean - val)
        }
    
        return Double(temp / Double(array.count)).roundToPlaces(2)
    }
    
    func getStdDev(array: Array<Double>) -> Double {
        return Double(sqrt(getVariance(array))).roundToPlaces(2)
    }
    
    func getMedian(array: Array<Double>) -> Double {
        
        let arr = array.sort(<)
        
        if (arr.count % 2 == 0) {
            return (Double(arr[(arr.count/2) - 1]) + Double(arr[arr.count/2]))/2;
        }
            
        else {
            return Double(arr[arr.count / 2])
        }   
    }
    
    func getQuartile(array: Array<Double>) -> Double {
        
        // need to develop solution
        return 0
    }
}
