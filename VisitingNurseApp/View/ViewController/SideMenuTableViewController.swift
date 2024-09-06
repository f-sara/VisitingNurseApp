//
//  SideMenuViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/03.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    enum ViewIdentifier: Int {
        case mainCalendar
        case patientList
        case staffList
        case laborManagement

        var identifier: String {
            switch self {
            case .mainCalendar:
                R.storyboard.mainCalendar.name
            case .patientList:
                R.storyboard.patientList.name
            case .staffList:
                R.storyboard.staffList.name
            case .laborManagement:
                R.storyboard.laborManagement.name
            }
        }

    }

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
        guard let index = ViewIdentifier(rawValue: indexPath.row) else {return}

        dismiss(animated: true) {
            self.showView(identifier: index.identifier)
        }

    }

    func showView(identifier: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        appDelegate.switchView(identifier: identifier)
    }


}
