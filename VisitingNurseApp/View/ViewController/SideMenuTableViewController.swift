//
//  SideMenuViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/03.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: R.nib.sideMenuTableViewCell.name, bundle: nil), forCellReuseIdentifier: R.nib.sideMenuTableViewCell.name)
        tableView.rowHeight = 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.sideMenuTableViewCell.name, for: indexPath) as! SideMenuTableViewCell
        cell.setup(index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        var identifier: String

        switch indexPath.row {
        case 0:
            identifier = R.storyboard.mainCalendar.name
        case 1:
            identifier = R.storyboard.patientList.name
        case 2:
            identifier = R.storyboard.staffList.name
        case 3:
            identifier = R.storyboard.laborManagement.name
        default:
            identifier = R.storyboard.mainCalendar.name
        }


        dismiss(animated: true) {
            self.showView(identifier: identifier)
        }

    }

    func showView(identifier: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        appDelegate.switchView(identifier: identifier)
    }


}
