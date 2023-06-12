//
//  AddTransactionsTests.swift
//  ExpensoUITests
//
//  Created by Duarte Pina on 10/06/2023.
//

import XCTest


final class AddTransactionsTests: XCTestCase {
    var app: XCUIApplication!
    var base: Base!
    var dashboardScreen: DashboardScreen!
    var addEditTransactionsScreen: AddEditTransactionsScreen!
    var transactionDetailsScreen: TransactionDetailsScreen!
    
    enum TestParameters {
        static let incomeTrName = "Automated Income"
        static let incomeTrValue = "1500.00"
        static let expenseTrName = "Automated Expense"
        static let expenseTrValue = "135.35"
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        base = Base(app: app)
        dashboardScreen = DashboardScreen(app: app)
        addEditTransactionsScreen = AddEditTransactionsScreen(app: app)
        transactionDetailsScreen = TransactionDetailsScreen(app: app)
        
        /** If existing transactions remain from previous failed tests, clean up the enviroment by deleting them first
         */
        while dashboardScreen.transactionView.exists {
            dashboardScreen.transactionView.tap()
            transactionDetailsScreen.doDeleteTransactionWithConfirmation()
        }
        
        /** Then, assert that the "No transactions yet" element is visible and create new expense
         */
        XCTAssert(dashboardScreen.noTransactionText.exists, "Element is not visible")
        dashboardScreen.doAddExpenses()
    }

    override func tearDownWithError() throws {
        /** Clean up test environment by deleting transactions if they exist
         */
        while dashboardScreen.transactionView.exists {
            dashboardScreen.transactionView.tap()
            transactionDetailsScreen.doDeleteTransactionWithConfirmation()
        }
        
        base.doWaitForElementToExist(elementToWaitFor: dashboardScreen.noTransactionText, timeout: 5)
        
    }

    func testAddIncome() throws {
        /** Check correct screen is displayed
         */
        XCTAssert(addEditTransactionsScreen.addTransactionTitleText.exists, "Element is not visible")

        /** Add transaction information
         */
        addEditTransactionsScreen.doAddTransactionTitle(title: TestParameters.incomeTrName)
        addEditTransactionsScreen.doAddTransactionAmount(amount: TestParameters.incomeTrValue)

        /** Change transaction description
         */
        addEditTransactionsScreen.setTransactionDescription(transactionDescription: "Others")
        addEditTransactionsScreen.setTransactionNote(note: "Automated Test Note")
        addEditTransactionsScreen.addTransactionButton.tap()

        /** Check transaction was created correctly
         */
        XCTAssert(dashboardScreen.totalBalanceText.exists, "Element is not visible")
        XCTAssert(dashboardScreen.totalBalanceAmount.exists, "Element is not visible")
        XCTAssertEqual(dashboardScreen.totalBalanceAmount.label, "$\(TestParameters.incomeTrValue)")
    }
    
    func testAddExpense() throws {
        /** Check correct screen is displayed
         */
        XCTAssert(addEditTransactionsScreen.addTransactionTitleText.exists, "Element is not visible")

        /** Add transaction information
         */
        addEditTransactionsScreen.doAddTransactionTitle(title: TestParameters.expenseTrName)
        addEditTransactionsScreen.doAddTransactionAmount(amount: TestParameters.expenseTrValue)

        /** Change transaction description
         */
        addEditTransactionsScreen.setTransactionType(transactionType: "Expense")
        addEditTransactionsScreen.setTransactionDescription(transactionDescription: "Utilities")
        addEditTransactionsScreen.setTransactionNote(note: "Automated Test Note")
        addEditTransactionsScreen.addTransactionButton.tap()

        /** Check transaction was created correctly
         */
        XCTAssert(dashboardScreen.totalBalanceText.exists, "Element is not visible")
        XCTAssert(dashboardScreen.totalBalanceAmount.exists, "Element is not visible")
        XCTAssertEqual(dashboardScreen.totalBalanceAmount.label, "$-\(TestParameters.expenseTrValue)")
    }
    
    func testAddTransactionMandatoryFields() throws {
        /** Check correct screen is displayed
         */
        XCTAssert(addEditTransactionsScreen.addTransactionTitleText.exists, "Element is not visible")

        /** Tap on addTransactionButton without mandatory fields filled in should trigger title alert
         */
        addEditTransactionsScreen.addTransactionButton.tap()
        XCTAssert(addEditTransactionsScreen.alert.exists, "Alert is not displayed")
        XCTAssert(addEditTransactionsScreen.enterTitleAlertText.exists, "Alert title is not diplayed")
        addEditTransactionsScreen.alertOkButton.tap()
        
        /** Fill in title details
         */
        addEditTransactionsScreen.doAddTransactionTitle(title: "Title")
        
        /** Tap on addTransactionButton without mandatory fields filled in should trigger amount alert
         */
        addEditTransactionsScreen.addTransactionButton.tap()
        XCTAssert(addEditTransactionsScreen.alert.exists, "Alert is not displayed")
        XCTAssert(addEditTransactionsScreen.enterAmountAlertText.exists, "Alert is not displayed")
        addEditTransactionsScreen.alertOkButton.tap()
        
        /** Tap on addTransactionButton with an invalid number amount should trigger invalid number alert
         */
        addEditTransactionsScreen.doAddTransactionAmount(amount: "100.01.01")
        addEditTransactionsScreen.addTransactionButton.tap()
        XCTAssert(addEditTransactionsScreen.alert.exists, "Alert is not displayed")
        XCTAssert(addEditTransactionsScreen.enterValidNumberAlertText.exists, "Alert is not displayed")
        addEditTransactionsScreen.alertOkButton.tap()
        
        /** Tap on addTransactionButton with a negative number amount should trigger invalid number alert
         */
        addEditTransactionsScreen.transactionAmountInput.tap()
        base.clearText(inputElement: addEditTransactionsScreen.transactionAmountInput)
        addEditTransactionsScreen.transactionTitleInput.tap()
        addEditTransactionsScreen.doAddTransactionAmount(amount: "-100")
        addEditTransactionsScreen.addTransactionButton.tap()
        XCTAssert(addEditTransactionsScreen.alert.exists, "Alert is not displayed")
        XCTAssert(addEditTransactionsScreen.noNegativeNumberAlertText.exists, "Alert is not displayed")
        addEditTransactionsScreen.alertOkButton.tap()
        
        /** Tap on addTransactionButton with an amount bigger than 1000000000 should trigger invalid smaller amount alert
         */
        addEditTransactionsScreen.transactionAmountInput.tap()
        base.clearText(inputElement: addEditTransactionsScreen.transactionAmountInput)
        addEditTransactionsScreen.transactionTitleInput.tap()
        addEditTransactionsScreen.doAddTransactionAmount(amount: "1000000001")
        addEditTransactionsScreen.addTransactionButton.tap()
        XCTAssert(addEditTransactionsScreen.alert.exists, "Alert is not displayed")
        XCTAssert(addEditTransactionsScreen.enterSmallerAmountAlertText.exists, "Alert is not displayed")
        addEditTransactionsScreen.alertOkButton.tap()
    }
}
