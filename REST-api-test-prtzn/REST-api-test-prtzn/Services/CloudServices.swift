//
//  CloudServices.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 07.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import Foundation
import Alamofire

struct CloudServices {

    static func makeSecurityLogin(userName:String,
                                  password:String) {

        let currentAppSettings = AppSettings()

        let dic:Parameters = ["email" : userName,
                              "password" : password,
                              "remember_me" : false,
                              "client_key": currentAppSettings.securityLoginKey]
//
//        let jsonParameters = createJsonParameters(dic)
//
//        let parameters: Parameters = [
//            "json": jsonParameters ?? ""]
        let parameters = dic


        Alamofire.request(currentAppSettings.apiServerURL + ":8443/rest/securityLogin",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default)

            .responseJSON{ response in
                switch response.result {
                case .success:
                    print(response)

                    break
                case .failure(let error):

                    print(error)
                }
        }

    }

    static func getUserDevices() {

    }

    private static func createJsonParameters(_ dic: Parameters,
                                             prettyPrinted: Bool = false) -> Any? {

        do {
            let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : []
            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: options)
            // here "jsonData" is the dictionary encoded in JSON data


            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // here "decoded" is of type `Any`, decoded from JSON data

            if JSONSerialization.isValidJSONObject(decoded) {
                var convertedString = String(data: jsonData, encoding: String.Encoding.utf8)
//                print (decoded)
//                convertedString?.contains("\"")
//                convertedString = convertedString?.replacingOccurrences(of: "\", with: "")

                //print (convertedString)
//                return decoded
                return convertedString
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}