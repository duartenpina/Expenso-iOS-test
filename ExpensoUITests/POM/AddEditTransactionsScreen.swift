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
    
    var alert: XCUIElement {
        return app.alerts["Expenso"]
    }
    
    var enterTitleAlertText: XCUIElement {
        return app.staticTexts["Enter Title"]
    }
    
    var enterAmountAlertText: XCUIElement {
        return app.staticTexts["Enter Amount"]
    }
    
    var enterValidNumberAlertText: XCUIElement {
        return app.staticTexts["Enter valid number"]
    }
    
    var noNegativeNumberAlertText: XCUIElement {
        return app.staticTexts["Amount can't be negative"]
    }
    
    var enterSmallerAmountAlertText: XCUIElement {
        return app.staticTexts["Enter a smaller amount"]
    }
    
    var alertOkButton: XCUIElement {
        return app.buttons["OK"]
    }
        
    // Helper functions
    
    /** Types in the title of a transaction to the title textField
     - Parameters:
        - title: the string to type in
     */
    func doAddTransactionTitle(title: String) {
        transactionTitleInput.tap()
        transactionTitleInput.typeText(title)
    }
    
    /** Types in the amount of a transaction to the amount textField
     - Parameters:
        - amount: the string to type in
     */
    func doAddTransactionAmount(amount: String) {
        transactionAmountInput.tap()
        transactionAmountInput.typeText(amount)
    }
    
    /** Sets the transaction type to one of the possible options
     - Parameters:
        - transactionType: the string with the name of the transaction types available
     */
    func setTransactionType(transactionType: String) {
        transactionTypeDropdown.tap()
        let transactionTypeElement = app.buttons[transactionType]
        transactionTypeElement.tap()
    }
    
    /** Sets the transaction description to one of the possible options
     - Parameters:
        - transactionDescription: the string with the name of the transaction descriptions available
     */
    func setTransactionDescription(transactionDescription: String) {
        transactionDescriptionDropdown.tap()
        let transactionDescriptionElement = app.buttons[transactionDescription]
        transactionDescriptionElement.tap()
    }
    
    /** Types in some notes to the Note textField
     - Parameters:
        - note: the string with the note text to type in
     */
    func setTransactionNote(note: String) {
        transactionNoteInput.tap()
        transactionNoteInput.typeText(note)
    }
    
    // Intialize with the app instance
    init(app: XCUIApplication) {
        self.app = app
    }
}
