//
//  AddUIAction.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/11/22.
//

import UIKit

enum AddUIAction {

    static func addCheckBoxAction(button: UIButton) {
        let action = UIAction() { _ in
            if button.image(for: .normal) == UIImage(systemName: "checkmark.square.fill") {
                button.setImage(UIImage(systemName: "square"), for: .normal)
            } else {
                button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }
        }

        button.addAction(action, for: .touchDown)
    }
}
