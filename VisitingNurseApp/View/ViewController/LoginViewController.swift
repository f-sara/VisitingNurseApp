//
//  LoginViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/07/06.
//

import UIKit

class LoginViewController: UIViewController, LoginPresenterOutput {

    private var presenter: LoginPresenter!

    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = LoginPresenter(output: self, model: LoginModel())
    }

    @IBAction func loginButton(_ sender: Any) {
        showMainCalendar()
    }

    func showMainCalendar() {
        if codeTextField.text?.isEmpty ?? true || userTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true {
            return
        }
        if presenter.loginAuth() {
            performSegue(withIdentifier: R.segue.loginViewController.showMainCalendar, sender: nil)
        }
    }
}
