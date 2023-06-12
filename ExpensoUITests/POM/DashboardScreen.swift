//
//  DashboardScreen.swift
//  ExpensoUITests
//
//  Created by Duarte Pina on 10/06/2023.
//

import XCTest

class DashboardScreen {
    let app: XCUIApplication
    
    // Screen elements
    var dashboardTitleText: XCUIElement {
        return app.staticTexts["Dashboard"]
    }
    
    var noTransactionText: XCUIElement {
        return app.staticTexts["No Transaction Yet!"]
    }
    
    var filterButton: XCUIElement {
        return app.buttons["button2"]
    }
    
    var optionsButton: XCUIElement {
        return app.buttons["button1"]
    }
    
    var addExpenseButton: XCUIElement {
        return app.buttons["plusIcon"]
    }
    
    var totalBalanceText: XCUIElement {
        return app.staticTexts["TOTAL BALANCE"]
    }
    
    var totalBalanceAmount: XCUIElement {
        return app.staticTexts["balanceAmount"]
    }
    
    var transactionView: XCUIElement {
        return app.staticTexts["viewTransaction"]
    }
    
    // Helper functions
    func doOpenFilters() {
        filterButton.tap()
    }
    
    func doOpenOptions() {
        optionsButton.tap()
    }
    
    func doAddExpenses() {
        addExpenseButton.tap()
    }
    
    func doViewTransactionByName(transactionElementName: String) {
        let transactionElement = app.staticTexts[transactionElementName]
        transactionElement.tap()
    }
    
    // Intialize with the app instance
    init(app: XCUIApplication) {
        self.app = app
    }
}
