//
//  StartPoint.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 06.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import DeviceKit

struct StartPoint {

    static func StartTheProgram(_ window: UIWindow?) {

        let errorMessage = "can`t detect initial view controller!"

        guard let appWindow = window else {
            print(errorMessage)
            return
        }

        var firstViewController: LoginScreenViewController?

        let device = Device()
        if device.isPod {
            // iPods (real or simulator)
        } else if device.isPhone {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            firstViewController = storyboard.instantiateViewController(withIdentifier: "iPhoneSmallViewController") as! iPhoneSmallViewController

        } else if device.isPad {
            let storyboard = UIStoryboard(name: "MainIPad", bundle: nil)
            firstViewController = storyboard.instantiateViewController(withIdentifier: "iPadViewController") as! iPadViewController
        }

        if let firstViewControllerInitiated = firstViewController {
            let nav = UINavigationController(rootViewController: firstViewControllerInitiated)

            appWindow.rootViewController = nav
            appWindow.makeKeyAndVisible()
        } else {
            print(errorMessage)
        }
    }
}


