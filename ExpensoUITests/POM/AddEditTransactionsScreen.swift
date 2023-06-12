//
//  AddEditTransactionsScreen.swift
//  ExpensoUITests
//
//  Created by Duarte Pina on 12/06/2023.
//

import XCTest

class AddEditTransactionsScreen {
    let app: XCUIApplication
    
    // Screen elements
    var addTransactionTitleText: XCUIElement {
        return app.staticTexts["Add Transaction"]
    }
    
    var transactionTitleInput: XCUIElement {
        return app.textFields["Title"]
    }
    
    var transactionAmountInput: XCUIElement {
        return app.textFields["Amount"]
    }
    
    var transactionTypeDropdown: XCUIElement {
        return app.buttons["Income"]
    }
    
    enum TransactionTypes {
        static let income = "Income"
        static let expense = "Expense"
    }
    
    var transactionDescriptionDropdown: XCUIElement {
        return app.buttons["Transport"]
    }
    
    enum TransactionDescriptions {
        static let transport = "Transport"
        static let food = "Food"
        static let housing = "Housing"
        static let insurance = "Insurance"
        static let medical = "Medical"
        static let savings = "Savings"
        static let personal = "Personal"
        static let entertainment = "Entertainment"
        static let others = "Others"
        static let utilities = "Utilities"
    }
    
    var transactionNoteInput: XCUIElement {
        return app.textFields["Note"]
    }
    
    var addTransactionButton: XCUIElement {
        return app.buttons["saveTransactionButton"]
    }
        
    // Helper functions
    func doAddTransactionTitle(title: String) {
        transactionTitleInput.tap()
        transactionTitleInput.typeText(title)
    }
    
    func doAddTransactionAmount(amount: String) {
        transactionAmountInput.tap()
        transactionAmountInput.typeText(amount)
    }
    
    func setTransactionType(transactionType: String) {
        transactionTypeDropdown.tap()
        let transactionTypeElement = app.buttons[transactionType]
        transactionTypeElement.tap()
    }
    
    func setTransactionDescription(transactionDescription: String) {
        transactionDescriptionDropdown.tap()
        let transactionDescriptionElement = app.buttons[transactionDescription]
        transactionDescriptionElement.tap()
    }
    
    func setTransactionNote(note: String) {
        transactionNoteInput.tap()
        transactionNoteInput.typeText(note)
    }
    
    // Intialize with the app instance
    init(app: XCUIApplication) {
        self.app = app
    }
}
