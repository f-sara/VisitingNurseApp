//
//  PatientListViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/04.
//

import UIKit
import SideMenu

final class PatientListViewController: UIViewController {

    @IBOutlet weak var showSideMenuButton: UIButton!
    @IBOutlet weak var areaButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    private let patientList: [PatientModel] = [
        PatientModel(patientName: "John Doe", service: "Nursing", staffName: "Manager A", area: "西区"),
        PatientModel(patientName: "Jane Smith", service: "Physical Therapy", staffName: "Manager B", area: "須磨"),
        PatientModel(patientName: "Michael Brown", service: "Speech Therapy", staffName: "Manager C", area: "明石"),
        PatientModel(patientName: "Emily Davis", service: "Occupational Therapy", staffName: "Manager D", area: "垂水区")
    ]

    private var filteredList: [PatientModel] = []
    private var filteredFlag = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAreaButton()
        tableView.register(UINib(nibName: R.nib.patientTableViewCell.name, bundle: nil), forCellReuseIdentifier: R.nib.patientTableViewCell.name)
    }

    private func setupAreaButton() {
        areaButton.menu = UIMenu(children: [
            UIAction(title: "すべてのエリア", state: .on, handler:{_ in
                self.filteredFlag = false
                self.tableView.reloadData()
            }),
            UIAction(title: "西区", state: .on, handler:{_ in
                self.filteredArea(area: "西区")
            }),
            UIAction(title: "垂水区", state: .on, handler:{_ in
                self.filteredArea(area: "垂水区")

            }),
            UIAction(title: "須磨", state: .on, handler:{_ in
                self.filteredArea(area: "須磨")
            }),
            UIAction(title: "明石", state: .on, handler:{_ in
                self.filteredArea(area: "明石")
            })

        ])
        areaButton.showsMenuAsPrimaryAction = true
        areaButton.changesSelectionAsPrimaryAction = true
    }

    private func filteredArea(area: String) {
        self.filteredFlag = true
        self.filteredList = self.patientList.filter { $0.area == area}
        self.tableView.reloadData()
    }
}

extension PatientListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredFlag {
            return filteredList.count
        } else {
            return patientList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.patientTableViewCell.name, for: indexPath) as! PatientTableViewCell
        var patientModel = self.patientList
        if filteredFlag {
            patientModel = self.filteredList
        }
        cell.setupUI(patientModel: patientModel[indexPath.row])
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}


extension PatientListViewController: SideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
        showSideMenuButton.isHidden = true
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
        showSideMenuButton.isHidden = false
    }
}
