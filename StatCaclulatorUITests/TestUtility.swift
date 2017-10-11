//
//  TestUtility.swift
//  Check24Task
//
//  Created by GIB on 7/24/16.
//  Copyright © 2016 Xmen. All rights reserved.
//

import XCTest

class TestUtility: NSObject {

    
    class func getXCUIElement(_ app: XCUIApplication, identifier: String, type: String) -> XCUIElement {
        
        var element: XCUIElement? = nil
        
        switch type {
        case "button": element = app.buttons[identifier]
        case "label": element = app.staticTexts[identifier]
        case "textField": element = app.textFields[identifier]
        default: break
        }
        
        return element!
    }
    
    class func getNavigationButton(_ app: XCUIApplication, identifier: String, navigation: String) -> XCUIElement {
        
        return app.navigationBars[navigation].buttons[identifier]
    }
    
    
    
}
