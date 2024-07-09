//
//  LoginViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/07/06.
//

import UIKit

class LoginViewController: UIViewController, LoginPresenterOutput {

    private var presenter: LoginPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = LoginPresenter(output: self, model: LoginModel())
    }

    @IBAction func loginButton(_ sender: Any) {
        showMainCalendar()
    }

    func showMainCalendar() {
        if presenter.loginAuth() {
            performSegue(withIdentifier: "showMainCalendar", sender: nil)
        }
    }
}
