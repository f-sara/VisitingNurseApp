//
//  PatientTableViewCell.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/10/23.
//

import UIKit

class PatientTableViewCell: UITableViewCell {

    @IBOutlet weak var patientNameLabel: UILabel!
    @IBOutlet weak var staffNameLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!

    private let patientList  = ["西区", "垂水区","須磨", "明石"]

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setupUI(patientModel: PatientModel) {
        patientNameLabel.text = patientModel.patientName
        areaLabel.text = patientModel.staffName
        serviceLabel.text = patientModel.service
        areaLabel.text = patientModel.area
    }

}
