//
//  StaffListViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/04.
//

import UIKit
import SideMenu

final class StaffListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showSideMenuButton: UIButton!
    @IBOutlet weak var uptimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: R.nib.staffTableViewCell.name, bundle: nil), forCellReuseIdentifier: R.nib.staffTableViewCell.name)
        tableView.register(UINib(nibName: R.nib.topStaffTableViewCell.name, bundle: nil), forCellReuseIdentifier: R.nib.topStaffTableViewCell.name)
    }

}

extension StaffListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.staffTableViewCell.name, for: indexPath) as! StaffTableViewCell
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 50
     }

}

extension StaffListViewController: SideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        showSideMenuButton.isHidden = true
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        showSideMenuButton.isHidden = false
    }
}
