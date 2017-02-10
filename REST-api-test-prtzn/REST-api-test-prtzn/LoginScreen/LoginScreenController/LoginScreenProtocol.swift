//
//  LoginScreenProtocol.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//
import UIKit

protocol LoginScreenProtocol: UITextFieldDelegate {

    func logginUserOnServer(userName:String, password:String, getDevices:Bool)

}
