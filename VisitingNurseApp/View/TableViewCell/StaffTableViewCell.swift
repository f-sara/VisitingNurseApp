//
//  StaffTableViewCell.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/10.
//

import UIKit

class StaffTableViewCell: UITableViewCell {


    @IBOutlet weak var areaColor: UIImageView!
    @IBOutlet weak var staffNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(staffModel: StaffListModel) {
        staffNameLabel.text = staffModel.staffName
        positionLabel.text = staffModel.position
        areaLabel.text = staffModel.area
        departmentLabel.text = staffModel.department
        teamLabel.text = staffModel.team
        timeLabel.text = staffModel.formattedUptime
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
