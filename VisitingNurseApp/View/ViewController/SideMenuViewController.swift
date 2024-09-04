//
//  SideMenuViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/03.
//

import UIKit

class SideMenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let labelText = ["カレンダー", "患者", "職員情報", "経営数値"]
    let iconImage = [UIImage(named: R.image.calendar.name), UIImage(named: R.image.contactRound.name), UIImage(named: R.image.users.name), UIImage(named: R.image.chartColumnIncreasing.name)]


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: SideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.nib.sideMenuTableViewCell.name, for: indexPath) as! SideMenuTableViewCell
            // セルに表示する値を設定する
        cell.sideMenuText.text = labelText[indexPath.row]
        cell.sideMenuIcon.image = iconImage[indexPath.row]
            return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 4
    }

}
