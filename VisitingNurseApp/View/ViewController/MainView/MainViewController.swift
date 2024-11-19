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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
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

