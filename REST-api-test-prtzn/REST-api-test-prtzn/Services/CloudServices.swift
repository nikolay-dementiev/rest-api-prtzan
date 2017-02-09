//
//  CloudServices.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 07.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
//import ObjectMapper
import SwiftyJSON

struct CloudServices {

    static func makeSecurityLogin(userName:String,
                                  password:String,
                                  completion:@escaping (_ result: Bool, _ clarification: String) -> Void) {

        let currentAppSettings = AppSettings()

        let dic:Parameters = ["email": userName,
                              "password": password,
                              "remember_me": false,
                              "client_key": currentAppSettings.securityLoginKey]

        let parameters: Parameters = [
            "json": JSON(dic)]

        Alamofire.request(currentAppSettings.securityLoginURL,
                          method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: currentAppSettings.headers).responseObject
            { (response: DataResponse<LoginModel>) in

                switch response.result {
                case .success:
                    print(response)

                    if let loginModelObject:LoginModel = response.result.value {
                        if loginModelObject.error_code == 0 {//no error
                            completion(true, "")
                        } else {
                            completion(false, loginModelObject.showErrorDescription())
                        }
                    } else {
                        completion(false, "Error in func. makeSecurityLogin()")
                    }


                    break
                case .failure(let error):
                    print(error)
                    completion(false, error.localizedDescription)
                }
        }

    }

    static func getUserDevices(completion: @escaping (_ result: Bool, _ clarification: String,  _ devicesFromJSON:DevicesList?) -> Void)  {

        let currentAppSettings = AppSettings()
        let parameters: Parameters = [
            "json": "{}"]

        Alamofire.request(currentAppSettings.getUserDevicesURL,
                          method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: currentAppSettings.headers).responseObject
            { (response: DataResponse<DevicesList>) in
                switch response.result {
                case .success:
                    print(response)

                    if let devicesListObject:DevicesList = response.result.value {

                        if devicesListObject.error_code == 0 {//no error
                            completion(true, "", devicesListObject)
                        } else {
                            completion(false, devicesListObject.showErrorDescription(), nil)
                        }
                    } else {
                        completion(false, "Error in func. getUserDevices()", nil)
                    }

                    break
                case .failure(let error):
                    print(error)
                    completion(false, error.localizedDescription, nil)
                }
        }
    }
}
