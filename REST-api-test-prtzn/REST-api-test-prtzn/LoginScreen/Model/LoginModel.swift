//
//  LoginViewModel.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import ObjectMapper

class LoginModel: Mappable {
    private let unknowErrorCode:Int = 42

    var error_code:Int?
    var user_role:String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        error_code <- map["error_code"]

        guard error_code == 0 else {return}
        user_role <- map["user_role"]
    }

    func showErrorDescription() -> String {
        return descriptionOfError(error_code ?? unknowErrorCode)
    }

    private func descriptionOfError(_ errorCode: Int) -> String {

        switch errorCode {
        case 0:
            return "Request successfull."
        case 202:
            return "The user has not activated the account."
        case 204:
            return "User does not exist."
        case 205:
            return "Bad credentials."
        case 208:
            return "Unknown error."
        case 209:
            return "Invalid key for client api."
        default:
            return "Unknown error."
        }
    }
}

