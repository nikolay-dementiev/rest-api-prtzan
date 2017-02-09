//
//  LoginScreenViewController.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 04.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    @IBOutlet weak var loginInputDataView: LoginView!
    @IBOutlet weak var backgroundImage: UIImageView!

    fileprivate var devicesListModel: DevicesList?

    override func viewDidLoad() {
        super.viewDidLoad()

        loginInputDataView.loginViewControllerDelegat = self

        //test!
        loginInputDataView.emaiTextField.text = "nikolas.dementiev@gmail.com"
        loginInputDataView.passwordTextField.text = "JV2-bSE-PWm-22y"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMainWorkScreen" {

            let destinationVC = segue.destination
            let navVC = destinationVC as? UINavigationController
            let tabBarVC = navVC?.viewControllers.first as? UITabBarController
            let devicesVC = tabBarVC?.viewControllers?.first as? MainScreenDevicesViewController

            if  let devicesVCN = devicesVC {
                devicesVCN.devicesListModel = devicesListModel
            }
        }
    }

}

//MARK: LoginScreenProtocol

extension LoginScreenViewController: LoginScreenProtocol {

    func goToMainWorkScreen() {
        performSegue(withIdentifier: "goToMainWorkScreen", sender: self)
    }

    func logginUserOnServer(userName:String, password:String, getDevices:Bool = true) {

        CloudServices.makeSecurityLogin(userName: userName,
                                        password: password)
        { (loginOK: Bool, clarification: String) in
            if loginOK { // no error

                if getDevices {
                    self.getUserDevicesOnServer()

                } else {
                    //go to main work screen
                    self.goToMainWorkScreen()
                }

            } else {
                print("Problem to login occured: \(clarification)")
            }
        }
    }

    func getUserDevicesOnServer() {

        CloudServices.getUserDevices(completion: {
            (allOK:Bool, detailStr: String, devicesFromJSON:DevicesList?) in

            if allOK {
                self.devicesListModel = devicesFromJSON;

                //go to main work screen
                self.goToMainWorkScreen()
            } else {
                print("Problem to login occured: \(detailStr)")
            }

        })
    }

}
