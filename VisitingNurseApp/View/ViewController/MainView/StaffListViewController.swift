//
//  StaffListViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/09/04.
//

import UIKit
import SideMenu

final class StaffListViewController: UIViewController {

    private var presenter: StaffListPresenter!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showSideMenuButton: UIButton!
    @IBOutlet weak var areaButton: UIButton!

    private var staffList: [StaffModel] = []

    private var flag: Bool = false
    private var filteredFlag = false
    private var filteredStaffList: [StaffModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = StaffListPresenter(output: self, model: APIClient())
        tableView.register(UINib(nibName: R.nib.staffTableViewCell.name, bundle: nil), forCellReuseIdentifier: R.nib.staffTableViewCell.name)
        setupAreaButton()
        Task {
            await presenter.fetchStaffList()
        }
    }

    // TODO: バックエンド側で稼働時間が実装された後に実装する
    @IBAction func sotedUptime(_ sender: Any) {
    }

    private func setupAreaButton() {
        areaButton.menu = UIMenu(children: [
            UIAction(title: "すべてのエリア", state: .on, handler:{_ in
                self.filteredFlag = false
                self.tableView.reloadData()
            }),
            UIAction(title: "A", state: .on, handler:{_ in
                self.filteredArea(area: "A")
            }),
            UIAction(title: "B", state: .on, handler:{_ in
                self.filteredArea(area: "B")

            }),
            UIAction(title: "C", state: .on, handler:{_ in
                self.filteredArea(area: "C")
            }),
            UIAction(title: "D", state: .on, handler:{_ in
                self.filteredArea(area: "D")
            })

        ])
        areaButton.setTitle("所属エリア", for: .normal)
        areaButton.changesSelectionAsPrimaryAction = false
    }

    private func filteredArea(area: String) {
        self.filteredFlag = true
        self.filteredStaffList = self.staffList.filter { $0.area == area}
        self.tableView.reloadData()
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

extension StaffListViewController: StaffListPresenterOutput {

    func didFetchStaffList(_ staffList: [StaffModel]) {
        self.staffList = staffList
        Task { @MainActor in
            tableView.reloadData()
        }
    }

    func failFetchStaffList() {
        print("職員の取得に失敗")
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
