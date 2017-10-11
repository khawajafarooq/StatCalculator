//
//  CalculatorTestActor.swift
//  StatCaclulator
//
//  Created by GIB on 7/26/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import XCTest


class CalculatorTestActor: NSObject {
        
    let app: XCUIApplication!
    var expectation:XCTestExpectation?
    
    init(application: XCUIApplication) {
        app = application
    }
    
    // MARK: Helper Methods
    func pressButton(_ identifier: String) {
        let button = TestUtility.getXCUIElement(app, identifier: identifier, type: "button")
//        let exists = NSPredicate(format: "exists == true")
//        expectation(for: exists, evaluatedWithObject: button, handler: nil)
        button.tap()
//        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func pressNavigationButton(_ identifier: String, navigation: String) {
        let button = TestUtility.getNavigationButton(app, identifier: identifier, navigation: navigation)
        button.tap()
    }
    
    func getTableRowCount() -> Int {
        return Int(app.tables.count)
    }
    
    func inputNumbers(_ isEnterNeeded: Bool) {
        for index in 1...5 {
            
            pressButton("num\(index)Button")
            if isEnterNeeded {
                pressEnterButton()
            }
        }
    }
    
    func getTextField(_ cell: XCUIElement) -> XCUIElement {
        return cell.children(matching: .textField).element
    }
    
    func getCellByIndex(_ index: UInt) -> XCUIElement {
        return app.tables.children(matching: .cell).element(boundBy: index)
    }
    
    func setInput() {
        inputNumbers(true)
    }
    
    // MARK: UI Methods
    func pressNumberButtons() {
        inputNumbers(false)
    }
    
    func pressEnterButton() {
        pressButton("enterButton")
    }
    
    func pressClearButton() {
        pressButton("clearButton")
    }
    
    func pressSum() {
        pressButton("sumButton")
    }
    
    func pressMean() {
        pressButton("meanButton")
    }
    
    func pressVariance() {
        pressButton("varianceButton")
    }
    
    func pressMedian() {
        pressButton("medianButton")
    }
    
    func pressMeanSquare() {
        pressButton("meanSqrButton")
    }
    
    func pressStdDeviation() {
        pressButton("stdDevButton")
    }
    
    func pressQuartile() {
        pressButton("quartileButton")
    }
    
    func pressListButton() {
        pressNavigationButton("List", navigation: "Calculator")
    }
    
    func pressClearListButton() {
        pressNavigationButton("Clear", navigation: "StatCaclulator.NumberTableView")
    }
    
    func pressEditList() {
        pressNavigationButton("Edit", navigation: "StatCaclulator.NumberTableView")
    }
    
    func pressDone() {
        pressNavigationButton("Done", navigation: "StatCaclulator.NumberTableView")
    }
    
    func pressBack() {
        pressNavigationButton("Calculator", navigation: "StatCaclulator.NumberTableView")
    }
    
    func pressNegate() {
        app.tables.buttons["Negate"].tap()
    }
    
    func pressDeleteRow() {
        let tablesQuery = app.tables
        tablesQuery.buttons["Delete "].tap()
        tablesQuery.buttons["Delete"].tap()
    }
    
    func editCellValue(_ text: String) -> String {
        let cell = getCellByIndex(0)
        let textField = getTextField(cell)
        textField.clearAndEnterText(text)
        return textField.value as! String
    }
    
    func getCellValue() -> String {
        let cell = getCellByIndex(0)
        let staticText = cell.children(matching: .staticText).element
        return staticText.label
    }
    
    func getResultLabel() -> String {
        let staticText = TestUtility.getXCUIElement(app, identifier: "displayLabel", type: "label")
        return staticText.label
    }
}
