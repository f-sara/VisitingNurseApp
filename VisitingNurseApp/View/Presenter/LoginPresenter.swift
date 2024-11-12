//
//  LoginPresenter.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/07/09.
//

import Foundation

protocol LoginPresenterInput: AnyObject {
    func loginAuth() -> Bool
}

protocol LoginPresenterOutput: AnyObject {
    func showMainCalendar()
}

final class LoginPresenter: LoginPresenterInput{

    // MARK: Private Properties
    private weak var output: LoginPresenterOutput!
    private var model: LoginModel!


    // MARK: Initializers
    init(output: LoginPresenterOutput, model: LoginModel) {
        self.output = output
        self.model = model
    }

    func loginAuth() -> Bool {
        return model.authentication(auth: true)
    }
}
