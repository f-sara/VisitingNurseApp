//
//  SideMenuTableViewCell.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/04.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var sideMenuIcon: UIImageView!
    @IBOutlet weak var sideMenuText: UILabel!

    let labelText = ["カレンダー", "患者", "職員情報", "経営数値"]
    let iconImage = [UIImage(named: R.image.calendar.name), UIImage(named: R.image.contactRound.name), UIImage(named: R.image.users.name), UIImage(named: R.image.chartColumnIncreasing.name)]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(index: Int) {
        sideMenuIcon.image = iconImage[index]
        sideMenuText.text = labelText[index]
    }

}
