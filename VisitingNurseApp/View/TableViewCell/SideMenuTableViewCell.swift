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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
