//
//  CalculatorTests.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import XCTest

enum Operation: String {
    
    case Sum = "1"
    case Mean = "2"
    case MeanOfSquaredSum = "3"
    case Variance = "4"
    case StdDeviation = "5"
    case Median = "6"
    case Quartile = "7"
}

class CalculatorTests: XCTestCase {
    
    let calculator = StatCalculator()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func setInput1() {
        calculator.operandStack = [1, 3, 8]
    }
    
    func setInput2() {
        calculator.operandStack = [1, 12, 19.5, -5, 3, 8]
    }
    
    func testHasCalculator() {
        XCTAssertNotNil(calculator)
    }
    
    func testCalculateSum() {
        
        setInput1()
        let result = calculator.evaluate(Operation.Sum.rawValue)
        
        XCTAssertEqual(result, 12)
    }
    
    func testCalculateMean() {
        
        setInput1()
        let result = calculator.evaluate(Operation.Mean.rawValue)
        
        XCTAssertEqual(result, 4)
    }
    
    func testCalculateMeanSquare() {
        setInput1()
        let result = calculator.evaluate(Operation.MeanOfSquaredSum.rawValue)
        
        XCTAssertEqual(result, 24.67)
    }
    
    func testCalculateVariance() {
        setInput2()
        let result = calculator.evaluate(Operation.Variance.rawValue)
        
        XCTAssertEqual(result, 62.70)
    }
    
    func testCalculateMedian() {
        setInput2()
        let result = calculator.evaluate(Operation.Median.rawValue)
        
        XCTAssertEqual(result, 5.5)
    }
    
    func testCalculateStdDeviation() {
        setInput2()
        let result = calculator.evaluate(Operation.StdDeviation.rawValue)
        
        XCTAssertEqual(result, 7.92)
    }
    
    func testCalculateQuartile() {
        setInput2()
        let result = calculator.evaluate(Operation.Quartile.rawValue)
        
        XCTAssertEqual(result, 0)
    }
    
}
