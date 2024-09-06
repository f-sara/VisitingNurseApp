//
//  AppDelegate.swift
//  VisitingNurseApp
//
//  Created by 藤井紗良 on 2024/06/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let loginFlag = false

    var window: UIWindow?

    var storyboard: UIStoryboard {
        if loginFlag {
            print(R.storyboard.login_iPad.name)
            return UIStoryboard(name: R.storyboard.login_iPad.name, bundle: nil)

        } else {
            return UIStoryboard(name: R.storyboard.mainCalendar.name, bundle: nil)
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        var initialViewController: UIViewController {
            if loginFlag {
                let loginViewController = self.storyboard.instantiateViewController(withIdentifier: R.storyboard.login_iPad.name)
                window?.rootViewController = loginViewController
                return loginViewController
            } else {
                let mainViewController = self.storyboard.instantiateViewController(withIdentifier: R.storyboard.mainCalendar.name)
                window?.rootViewController = mainViewController
                return mainViewController
            }
        }
        self.window?.rootViewController = initialViewController
        return true
    }

    func switchView(identifier: String) {
        UIView.transition(with: self.window!, duration: 1, animations: {
            let oldState: Bool = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            let switchStoryboard = UIStoryboard(name: identifier, bundle: nil)
            self.window?.rootViewController = switchStoryboard.instantiateViewController(withIdentifier: identifier)
            UIView.setAnimationsEnabled(oldState)
        }, completion: nil)
    }
}

