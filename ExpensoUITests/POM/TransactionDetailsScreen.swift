//
//  TransactionDetailsScreen.swift
//  ExpensoUITests
//
//  Created by Duarte Pina on 12/06/2023.
//

import XCTest

class TransactionDetailsScreen {
    let app: XCUIApplication
    
    // Screen elements
    var shareButton: XCUIElement {
        return app.buttons["button2"]
    }
    
    var deleteButton: XCUIElement {
        return app.buttons["button1"]
    }
    
    var editButton: XCUIElement {
        return app.buttons["editIcon"]
    }
    
    var deleteAlert: XCUIElement {
        return app.alerts["Are you sure you want to delete this transaction?"]
    }
    
    var alertDeleteButton: XCUIElement {
        return app.buttons["Delete"]
    }
    
    var alertCancelButton: XCUIElement {
        return app.buttons["Cancel"]
    }
        
    // Helper functions
    func doShareTransaction() {
        shareButton.tap()
    }
    
    func doDeleteTransaction() {
        deleteButton.tap()
    }
    
    func doDeleteTransactionWithConfirmation() {
        deleteButton.tap()
        alertDeleteButton.tap()
    }
    
    // Intialize with the app instance
    init(app: XCUIApplication) {
        self.app = app
    }
}
