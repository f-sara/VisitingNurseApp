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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAreaButton()
    }

    func setupAreaButton() {
        areaButton.menu = UIMenu(children: [
                UIAction(title: "西区", state: .on, handler:{_ in

                }),
                UIAction(title: "垂水区", state: .on, handler:{_ in

                }),
                UIAction(title: "須磨", state: .on, handler:{_ in

                }),
                UIAction(title: "明石", state: .on, handler:{_ in

                })

            ])
        areaButton.showsMenuAsPrimaryAction = true
        areaButton.changesSelectionAsPrimaryAction = true
    }



}

extension PatientListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.staffTableViewCell.name, for: indexPath) as! StaffTableViewCell
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
