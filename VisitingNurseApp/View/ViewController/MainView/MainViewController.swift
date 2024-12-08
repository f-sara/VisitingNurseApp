//
//  MainViewController.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/06/26.
//

import UIKit
import SideMenu
import FSCalendar

final class MainViewController: UIViewController {

    @IBOutlet weak var showSideMenuButton: UIButton!
    @IBOutlet weak var allSelectButton: UIButton!
    @IBOutlet weak var selfSelectButton: UIButton!

    @IBOutlet weak var calendarView: FSCalendar!

    override func viewDidLoad() {
        super.viewDidLoad()

        AddUIAction.addCheckBoxAction(button: allSelectButton)
        AddUIAction.addCheckBoxAction(button: selfSelectButton)
        setupCalendar()
        calendarView.layoutIfNeeded()
    }

    private func setupCalendar() {
        calendarView.locale = Locale(identifier: "ja_JP")
        calendarView.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
    }


}

extension MainViewController: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "CELL", for: date, at: position)
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.3
        return cell
    }
}


extension MainViewController: SideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        showSideMenuButton.isHidden = true
    }

    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        showSideMenuButton.isHidden = false
    }
}

