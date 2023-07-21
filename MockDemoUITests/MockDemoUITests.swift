//
//  MockDemoUITests.swift
//  MockDemoUITests
//
//  Created by M_2195552 on 2023-07-14.
//

import XCTest

final class MockDemoUITests: XCTestCase {

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

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

class when_user_click_on_login_button: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() async throws {
        app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = true
        app.launch()
    }
    
    func test_should_display_error_message_for_missing_required_fields() {
    
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func test_should_navigate_to_dashboard_page_when_authenticated() {
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let dashboardNavBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
    }
}
