//
//  LoginPageObject.swift
//  MockDemoUITests
//
//  Created by M_2195552 on 2023-07-24.
//

import Foundation
import XCTest

class LoginPageObject {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var usernameTextField: XCUIElement {
        app.textFields["usernameTextField"]
    }
    
    var passwordTextField: XCUIElement {
        app.textFields["passwordTextField"]
    }
    
    var loginButton: XCUIElement {
        app.buttons["loginButton"]
    }
    
    var messageText: XCUIElement {
        app.staticTexts["messageText"]
    }
    
    var dashboardNavBarTitle: XCUIElement {
        app.staticTexts["Dashboard"]
    }
}
