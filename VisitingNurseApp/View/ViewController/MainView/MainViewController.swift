//
//  MainViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/06/26.
//

import UIKit
import SideMenu

final class MainViewController: UIViewController {

    @IBOutlet weak var showSideMenuButton: UIButton!
    @IBOutlet weak var allSelectButton: UIButton!
    @IBOutlet weak var selfSelectButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        AddUIAction.addCheckBoxAction(button: allSelectButton)
        AddUIAction.addCheckBoxAction(button: selfSelectButton)
    }

}

extension MainViewController: SideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        showSideMenuButton.isHidden = true
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        showSideMenuButton.isHidden = false
    }
}

