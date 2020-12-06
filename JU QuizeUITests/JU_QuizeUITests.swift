//
//  JU_QuizeUITests.swift
//  JU QuizeUITests
//
//  Created by Peyman Osatian on 2020-10-31.
//  Copyright © 2020 Peyman Osatian. All rights reserved.
//

import XCTest

class JU_QuizeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let yourNameTextField = app.textFields["Your Name"]
        yourNameTextField.tap()
        yourNameTextField.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Click Me"]/*[[".buttons[\"Click Me\"].staticTexts[\"Click Me\"]",".staticTexts[\"Click Me\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Highscore"]/*[[".buttons[\"Highscore\"].staticTexts[\"Highscore\"]",".staticTexts[\"Highscore\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["JU_Quize.HighscoreTableView"].buttons["Back"].tap()
        
    }

    func testGame() throws {
        let app = XCUIApplication()
        app.launch()
        
        print(app.debugDescription)
        app.buttons["Start"].tap()
        
        var rightAnswers = 0
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["YEAAAAAAAA It's correct"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["YEAAAAAAAA It's correct"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["YEAAAAAAAA It's correct"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["YEAAAAAAAA It's correct"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        
        app.buttons.firstMatch.tap()
        XCTAssertEqual(app.alerts.count, 1)
        if app.alerts.staticTexts["YEAAAAAAAA It's correct"].exists {
            rightAnswers += 1
        }
        app.alerts.buttons.firstMatch.tap()
        XCTAssertTrue(app.staticTexts["Your Result"].exists)
        XCTAssertTrue(app.staticTexts["🤩 You answered \(rightAnswers) right from 5 Questions"].exists)
    }
}
