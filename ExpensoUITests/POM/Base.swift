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
    func doWaitForElementToExist(elementToWaitFor: XCUIElement, timeout: TimeInterval) {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: elementToWaitFor)
        let result = XCTWaiter.wait(for: [expectation], timeout: timeout)

        if result == .completed {
            print("Transaction was deleted successfully")
        }
    }
    
    // Intialize with the app instance
    init(app: XCUIApplication) {
        self.app = app
    }
}
