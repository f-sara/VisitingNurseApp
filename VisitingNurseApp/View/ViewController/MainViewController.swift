//
//  MainViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/06/26.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var showSideMenuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: false)
        buttonSetUp()
    }

    private func buttonSetUp() {
        showSideMenuButton.setImage(R.image.menu(), for: .normal)
        showSideMenuButton.tintColor = R.color.accentColor()
    }


}

