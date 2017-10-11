//
//  CalculatorViewControllerUITests.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import XCTest

class CalculatorViewControllerUITests: XCTestCase {
        
    var tester: CalculatorTestActor!
    
    override func setUp() {
        super.setUp()
        
        // setup testing environment
        continueAfterFailure = false
        tester = CalculatorTestActor(application: XCUIApplication())
        tester.app.launch()
        
        // wait until ui loads
        sleep(2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tester = nil
        super.tearDown()
    }
    
    func testTypeNumerOnKeypad() {
        tester.pressNumberButtons()
        XCTAssertEqual(tester.getResultLabel(), "12345")
    }
    
    func testAddNumberToList() {
        tester.pressNumberButtons()
        tester.pressEnterButton()
        tester.pressListButton()
        
        let rowCount = tester.getTableRowCount()
        XCTAssertTrue(rowCount > 0)
    }
    
    func testClearCurrentDisplay() {
        tester.pressNumberButtons()
        tester.pressClearButton()
        XCTAssertEqual(tester.getResultLabel(), "0")
    }
    
    func testClearList() {
        tester.setInput()
        tester.pressListButton()
        tester.pressClearListButton()
        tester.pressBack()
        
        XCTAssertEqual(tester.getTableRowCount(), 0)
    }
    
    func testRemoveIndividualItemInList() {
        tester.pressNumberButtons()
        tester.pressEnterButton()
        tester.pressListButton()
        
        let rowCountBefore = tester.getTableRowCount()
        
        tester.pressEditList()
        tester.pressDeleteRow()
        tester.pressDone()
        tester.pressBack()
        
        let rowCountAfter = tester.getTableRowCount()
        
        XCTAssertEqual(rowCountAfter, rowCountBefore - 1)
    }
    
    func testChangeIndividualItemInList() {
        tester.pressNumberButtons()
        tester.pressEnterButton()
        tester.pressListButton()
        tester.pressEditList()
        
        let textToChange = "1090"
        let result = tester.editCellValue(textToChange)
        
        tester.pressDone()
        
        XCTAssertEqual(result, textToChange)
    }
    
    func testNegateNumber() {
        tester.pressNumberButtons()
        tester.pressEnterButton()
        tester.pressListButton()
        tester.pressEditList()
        tester.pressNegate()
        tester.pressDone()
        
        XCTAssertEqual(tester.getCellValue(), "-12345.0")
    }
    
    func testComputeSum() {
        tester.setInput()
        tester.pressSum()
        
        XCTAssertEqual(tester.getResultLabel(), "15.0")
    }
    
    func testComputeMean() {
        tester.setInput()
        tester.pressMean()
        
        XCTAssertEqual(tester.getResultLabel(), "3.0")
    }
    
    func testComputeVariance() {
        tester.setInput()
        tester.pressVariance()
        
        XCTAssertEqual(tester.getResultLabel(), "2.0")
    }
    
    func testComputeMedian() {
        tester.setInput()
        tester.pressMedian()
        
        XCTAssertEqual(tester.getResultLabel(), "3.0")
    }
    
    func testComputeMeanSquare() {
        tester.setInput()
        tester.pressMeanSquare()
        
        XCTAssertEqual(tester.getResultLabel(), "11.0")
    }
    
    func testComputeStdDeviation() {
        tester.setInput()
        tester.pressStdDeviation()
        
        XCTAssertEqual(tester.getResultLabel(), "1.41")
    }
    
    func testComputeQuartile() {
        tester.setInput()
        tester.pressQuartile()
        
        XCTAssertEqual(tester.getResultLabel(), "0.0")
    }
    
}
