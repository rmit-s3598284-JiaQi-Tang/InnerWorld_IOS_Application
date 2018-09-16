//
//  InnerWorldUITests.swift
//  InnerWorldUITests
//
//  Created by Jacky Tang on 16/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import XCTest

class InnerWorldUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPassWordScreen() {

        let app = XCUIApplication()
        let button = app.buttons["0"]
        button.tap()
        button.tap()
        app.buttons["8"].tap()
        app.buttons["5"].tap()
        app.buttons["tick"].tap()
        app.alerts["wrong password"].buttons["OK"].tap()

    }
    func testHomeScreen() {
        let app = XCUIApplication()
        let button = app.buttons["0"]
        button.tap()
        button.tap()
        button.tap()
        button.tap()
        XCUIApplication().otherElements.containing(.staticText, identifier:"Enter your password").children(matching: .button).element(boundBy: 10).tap()

//      test whether the stack of diarys accessible
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["A happy day in St Kilda"]/*[[".cells.staticTexts[\"A happy day in St Kilda\"]",".staticTexts[\"A happy day in St Kilda\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["arrowBack"].tap()

    }
    func testCreateMoodScreen() {
        let app = XCUIApplication()
        let button = app.buttons["0"]
        button.tap()
        button.tap()
        button.tap()
        button.tap()
        XCUIApplication().otherElements.containing(.staticText, identifier:"Enter your password").children(matching: .button).element(boundBy: 10).tap()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        app.buttons["letsDoit"].tap()
        
//      test the mood control slider
        app.sliders["50%"].swipeRight()
    }
    func testSettingScreen() {
        let app = XCUIApplication()
        let button = app.buttons["0"]
        button.tap()
        button.tap()
        button.tap()
        button.tap()
        XCUIApplication().otherElements.containing(.staticText, identifier:"Enter your password").children(matching: .button).element(boundBy: 10).tap()

//      test the elements on setting screen work or not
        app.tabBars.children(matching: .button).element(boundBy: 2).tap()
        app.datePickers.pickerWheels["Today"].swipeUp()
        app.buttons["Save"].tap()
        app.alerts["New settings has been saved"].buttons["OK"].tap()
        app.buttons["log out"].tap()

    }
}
