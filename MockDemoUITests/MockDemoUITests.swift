//
//  MockDemoUITests.swift
//  MockDemoUITests
//
//  Created by M_2195552 on 2023-07-14.
//

import XCTest

class when_user_click_on_login_button: XCTestCase {
    private var app: XCUIApplication!
    private var loginPageObject: LoginPageObject!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        loginPageObject = LoginPageObject(app: app)
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = true
        app.launch()
    }
    
    func test_should_display_error_message_for_missing_required_fields() {
    
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func test_should_display_error_message_for_invalid_credentials() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("WrongPassword")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let messageText = loginPageObject.messageText
        XCTAssertEqual(messageText.label, "Invalid credentials")
    }
    
    func test_should_navigate_to_dashboard_page_when_authenticated() {
        let usernameTextField = loginPageObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("JohnDoe")
        
        let passwordTextField = loginPageObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = loginPageObject.loginButton
        loginButton.tap()
        
        let dashboardNavBarTitle = loginPageObject.dashboardNavBarTitle
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
    }
}
