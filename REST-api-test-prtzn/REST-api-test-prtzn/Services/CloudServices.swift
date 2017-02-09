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

        //        let jsonParameters = createJsonParameters(dic)

        let parameters: Parameters = [
            "json": JSON(dic)]//jsonParameters ?? ""]

        Alamofire.request(currentAppSettings.securityLoginURL,
                          method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: currentAppSettings.headers)

            //            .responseJSON{ response in
            .responseObject { (response: DataResponse<LoginModel>) in

                switch response.result {
                case .success:
                    print(response)

                    //                    if let resultValue = response.result.value {
                    //                        let json = JSON(resultValue)
                    //                        let jsonString = json.rawString()
                    //                        let LoginModelObject = Mapper<LoginModel>().map(JSONString: jsonString ?? "{}")
                    //                    }

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



    //    private static func createJsonParameters(_ dic: Parameters,
    //                                             prettyPrinted: Bool = false) -> Any? {
    //
    //        do {
    //            let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : []
    //            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: options)
    //            // here "jsonData" is the dictionary encoded in JSON data
    //
    //
    //            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
    //            // here "decoded" is of type `Any`, decoded from JSON data
    //
    //            if JSONSerialization.isValidJSONObject(decoded) {
    //                let convertedString = String(data: jsonData, encoding: String.Encoding.utf8)
    //                //                print (decoded)
    //                //                convertedString?.contains("\"")
    //                //                convertedString = convertedString?.replacingOccurrences(of: "\", with: "")
    //
    //                return convertedString
    //            }
    //
    //        } catch {
    //            print(error.localizedDescription)
    //        }
    //
    //        return nil
    //    }

    static func getUserDevices() {
        let currentAppSettings = AppSettings()
        let parameters: Parameters = [
            "json": "{}"]

        Alamofire.request(currentAppSettings.getUserDevicesURL,
                          method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: currentAppSettings.headers)

            //           .responseJSON { response in
            .responseObject { (response: DataResponse<DevicesList>) in
                switch response.result {
                case .success:
                    print(response)

                    //                    if true {//no error
                    //                        completion(true, "")
                    //                    }

                    if let devicesListObject:DevicesList = response.result.value {
                        if devicesListObject.error_code == 0 {//no error
                            //                        completion(true, "")
                        } else {
                            //                        completion(false, devicesListObject.showErrorDescription())
                        }
                    } else {
                        //completion(false, "Error in func. getUserDevices()")
                    }
                    
                    break
                case .failure(let error):
                    print(error)
                    //completion(false, error.localizedDescription)
                }
        }
        
        
    }
    
}
