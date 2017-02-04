//
//  LoginViewController.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 04.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var demoButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: custom interface settings
    private func ddd() {
        //#1
        // for normal state
        demoButton.setImage(UIImage(named: "btn_green_unpressed.png"), for: UIControlState.normal)

        // for Selected state
        demoButton.setImage(UIImage(named: "btn_green_pressed.png"), for: UIControlState.selected)

        //#2
        // for normal state
        loginButton.setImage(UIImage(named: "btn_blue_unpressed.png"), for: UIControlState.normal)

        // for Selected state
        loginButton.setImage(UIImage(named: "btn_blue_pressed.png"), for: UIControlState.selected)


    }

}
