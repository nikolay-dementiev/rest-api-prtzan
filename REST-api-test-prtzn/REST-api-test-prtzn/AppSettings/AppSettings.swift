//
//  AppSettings.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 07.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

struct AppSettings {

    let securityLoginKey = "111f69f077175ac67b88a8cdd18e1122"
    static let developerServerURL = "https://developer.partizancloud.com"

    lazy var apiServerURL:String = {
        return AppSettings.apiServerURL
    }()
    static let apiServerURL = "https://api.partizancloud.com"
    let headers = ["Content-Type": "application/x-www-form-urlencoded"]

    let securityLoginURL = developerServerURL + ":8443/rest/securityLogin"
    let getUserDevicesURL = developerServerURL + ":8443/restProtected/getUserDevices"
}
