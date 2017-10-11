//
//  StatCalculator.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import Foundation

class StatCalculator: NSObject {
    
    var operandStack: [Double] = []
    
    enum Operation: String {
        
        case Sum = "1"
        case Mean = "2"
        case MeanOfSquaredSum = "3"
        case Variance = "4"
        case StdDeviation = "5"
        case Median = "6"
        case Quartile = "7"
    }
    
    func pushOperand(_ operand: Double) {
        
        operandStack.append(operand)
    }
    
    func clearAllOperand() {
        if !operandStack.isEmpty {
            operandStack.removeAll()
        }
    }
    
    func removeOperand(at index: Int) {
        if !operandStack.isEmpty && index < operandStack.count {
            
            // Deleting operand from stack
            operandStack.remove(at: index)
        }
    }
    
    func evaluate(_ Op: String) -> Double? {
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
    func getMeanSquaredSum(_ array: [Double]) -> Double {
        
        var result = Array<Double>()
        for index in 0..<operandStack.count {
            let number = operandStack[index]
            result.append(number*number)
        }
        
        return getMean(result).round(to: 2)
    }
    
    func getSum(_ array: [Double]) -> Double {
        return array.reduce(0, +)
    }
    
    func getMean(_ array: [Double]) -> Double {
        return (getSum(array) / Double(array.count)).round(to: 2)
    }
    
    func getVariance(_ array: [Double]) -> Double {
        let mean = getMean(array)
        var temp: Double = 0;
        for val in array {
            temp += (mean - val) * (mean - val)
        }
    
        return Double(temp / Double(array.count)).roundround(to: 2)
    }
    
    func getStdDev(_ array: [Double]) -> Double {
        return Double(sqrt(getVariance(array))).round(to: 2)
    }
    
    func getMedian(_ array: [Double]) -> Double {
        
        let arr = array.sorted(by: <)
        
        if (arr.count % 2 == 0) {
            return (Double(arr[(arr.count/2) - 1]) + Double(arr[arr.count/2]))/2;
        }
            
        else {
            return Double(arr[arr.count / 2])
        }   
    }
    
    func getQuartile(_ array: [Double]) -> Double {
        
        // need to develop solution
        return 0
    }
}
