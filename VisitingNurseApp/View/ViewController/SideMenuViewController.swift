//
//  SideMenuViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/03.
//

import UIKit

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
            identifier = "SecondViewController"
        case 2:
            identifier = ""
        case 3:
            identifier = ""
        default:
            identifier = R.storyboard.mainCalendar.name
        }

        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        navigationController?.pushViewController(viewController, animated: true)

        dismiss(animated: true, completion: nil)
    }

}
