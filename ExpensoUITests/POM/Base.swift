//
//  Base.swift
//  ExpensoUITests
//
//  Created by Duarte Pina on 12/06/2023.
//

import XCTest

class Base {
    let app: XCUIApplication
    
    // Screen elements
    
    // Helper functions
    
    /** Waits for a given element to exist for a given amount of time
     - Parameters:
        - elementToWaitFor: the element that we want to exist after waiting some time
        - timeout: the max amount of time in seconds, that should wait for
     */
    func doWaitForElementToExist(elementToWaitFor: XCUIElement, timeout: TimeInterval) {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: elementToWaitFor)
        let result = XCTWaiter.wait(for: [expectation], timeout: timeout)

        if result == .completed {
            print("Transaction was deleted successfully")
        }
    }
    
    /** Clears the existing text in a textfield
     - Parameters:
        - inputElement: the element that has the text we want to clear
     */
    func clearText(inputElement: XCUIElement) {
        let fieldValue = inputElement.value as? String
        let deleteText = String(repeating: XCUIKeyboardKey.delete.rawValue, count: fieldValue!.count)
        inputElement.typeText(deleteText)
    }
    
    // Intialize with the app instance
    init(app: XCUIApplication) {
        self.app = app
    }
}
