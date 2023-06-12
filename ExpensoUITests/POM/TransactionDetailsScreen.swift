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
    
    /** Open the share transaction menu from the transaction details screen
     */
    func doShareTransaction() {
        shareButton.tap()
    }
    
    /** Deletes the transaction without confirming on the displayed alert
     */
    func doDeleteTransaction() {
        deleteButton.tap()
    }
    
    /** Deletes the transaction and also confirms on the displayed alert
     */
    func doDeleteTransactionWithConfirmation() {
        deleteButton.tap()
        alertDeleteButton.tap()
    }
    
    // Intialize with the app instance
    init(app: XCUIApplication) {
        self.app = app
    }
}
