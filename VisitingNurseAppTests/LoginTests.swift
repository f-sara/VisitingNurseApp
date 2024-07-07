//
//  LoginTests.swift
//  VisitingNurseAppTests
//
//  Created by 藤井紗良 on 2024/07/07.
//

import XCTest
@testable import VisitingNurseApp

final class LoginTests: XCTestCase {

    private let loginModel = LoginModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    private func testSuccessAuthentication() {
        let auth = loginModel.authentication(auth: true)
        XCTAssertEqual(true, auth)
    }

    private func testFailAuthentication() {
        let auth = loginModel.authentication(auth: false)
        XCTAssertEqual(false, auth)
    }


}
