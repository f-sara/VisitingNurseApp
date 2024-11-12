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
    @IBOutlet weak var areaButton: UIButton!

    private var staffList: [StaffListModel] = []

    private var flag: Bool = false
    private var filteredFlag = false
    private var filteredStaffList: [StaffListModel] = []

    private var apiClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: R.nib.staffTableViewCell.name, bundle: nil), forCellReuseIdentifier: R.nib.staffTableViewCell.name)
        setupAreaButton()
    }

    @IBAction func sotedUptime(_ sender: Any) {
//        if flag == false {
//            staffList.sort { $0.uptime < $1.uptime }
//            flag = true
//        } else if flag == true {
//            //OFFにする時に走らせたい処理
//            staffList.sort { $1.uptime < $0.uptime }
//            flag = false
//        }
//        self.tableView.reloadData()
    }

    private func fetchStaffList() async {
        let baseURL = URL(string: "http://localhost:8080/v1/facilities/01J6SMYDSKKKNJCR2Y3242T7YX/users")!
        apiClient.fetchData(url: baseURL,dataType: StaffListModel.self) { result in
            switch result {
            case .success(let data):
                self.staffList = data
            case .failure(let error):
                print("エラー: \(error)")
            }
        }
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
        areaButton.setTitle("所属エリア", for: .normal)
        areaButton.changesSelectionAsPrimaryAction = false
    }

    private func filteredArea(area: String) {
//        self.filteredFlag = true
//        self.filteredStaffList = self.staffList.filter { $0.area == area}
//        self.tableView.reloadData()
    }
}

extension StaffListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredFlag {
            return filteredStaffList.count
        } else {
            return staffList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.staffTableViewCell.name, for: indexPath) as! StaffTableViewCell
        var staffModel  = staffList
        if filteredFlag {
            staffModel = filteredStaffList
        }
        cell.setupUI(staffModel: staffModel[indexPath.row])
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
