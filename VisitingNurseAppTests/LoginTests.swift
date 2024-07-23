//
//  LoginTests.swift
//  VisitingNurseAppTests
//
//  Created by 藤井紗良 on 2024/07/07.
//

import XCTest
@testable import VisitingNurseApp

final class LoginTests:     XCTestCase {

    let loginModel = LoginModel()
    let loginViewController: LoginViewController =
    UIStoryboard(name: R.storyboard.login_iPad.name, bundle: nil)
        .instantiateViewController(identifier: "login_iPad")

    override func setUpWithError() throws {
        loginViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessAuthentication() {
        let auth = loginModel.authentication(auth: true)
        XCTAssertEqual(true, auth)
    }

    func testFailAuthentication() {
        let auth = loginModel.authentication(auth: false)
        XCTAssertEqual(false, auth)
    }

    func testCheckTextFieldEmpty() {
        loginViewController.codeTextField.text = ""
        loginViewController.userTextField.text = "hoge"
        loginViewController.passwordTextField.text = "hoge"

        let result = loginViewController.checkTextField()
        XCTAssertEqual(true, result)
    }

    func testCheckTextField() {
        loginViewController.codeTextField.text = "hoge"
        loginViewController.userTextField.text = "hoge"
        loginViewController.passwordTextField.text = "hoge"

        let result = loginViewController.checkTextField()
        XCTAssertEqual(false, result)
    }

}
