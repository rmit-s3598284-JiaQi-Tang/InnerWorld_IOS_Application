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

    func testFilterScreen() {
        //test whether the filter function works
        
        let app = XCUIApplication()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element(boundBy: 0).tap()
        app.buttons["tick"].tap()
        app.buttons["Clear Filter"].tap()
        

    }
    func testHomeScreen() {
        //test whether the stack view items are showing, and also their accessibility
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["St Kilda, Melbourne"]/*[[".cells.staticTexts[\"St Kilda, Melbourne\"]",".staticTexts[\"St Kilda, Melbourne\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["arrowBack"].tap()

    }
    func testCreateMoodScreen() {
        //test the mood control slider
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 1).tap()
        app.buttons["letsDoit"].tap()
        app.sliders["50%"].swipeRight()

    }
    func testSettingScreen() {
        //test the items show or not and whether accessible
        let app = XCUIApplication()
        app.tabBars.children(matching: .button).element(boundBy: 2).tap()
        app.datePickers.pickerWheels["Today"].swipeUp()
        app.buttons["Save"].tap()
        app.alerts["New settings has been saved"].buttons["OK"].tap()
        app.buttons["log out"].tap()

    }
}
