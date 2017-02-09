//
//  LIstOfDevices.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import Foundation
import ObjectMapper

class DevicesList: Mappable {
    private let unknowErrorCode:Int = 42

    var error_code:Int?
    var user_cameras:UserCameras?
    var shared_cameras:SharedCameras?
    var cameras_groups:CamerasGroups?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        error_code <- map["error_code"]

        guard error_code == 0 else {return}
        user_cameras <- map["user_cameras"]
        shared_cameras <- map["shared_cameras"]
        cameras_groups <- map["cameras_groups"]
    }

    func showErrorDescription() -> String {
        return descriptionOfError(error_code ?? unknowErrorCode)
    }

    private func descriptionOfError(_ errorCode: Int) -> String {

        switch errorCode {
        case 0:
            return "Request successfull."
        case 101:
            return "Session time expired."
        case 408:
            return "Unknown error."
        default:
            return "Unknown error."
        }
    }
}

//MARK: user_cameras
class UserCameras: Mappable {
    var cameras_group_id: Int?
    var cameras_group_name: String?
    var cameras: Camera?
    var folders: UserCameras?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        cameras_group_id <- map["cameras_group_id"]
        cameras_group_name <- map["cameras_group_name"]
        cameras <- map["cameras"]
        folders <- map["folders"]
    }
}

class Camera: Mappable {

    var storage_enabled: Bool?
    var camera_id: Int?
    var device_id: Int?
    var camera_name: String?
    var is_active: Bool?
    var is_online: Bool?
    var is_armed: Bool?
    var cameras_group_id: Int?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        storage_enabled <- map["storage_enabled"]
        camera_id <- map["camera_id"]
        device_id <- map["device_id"]
        camera_name <- map["camera_name"]
        is_active <- map["is_active"]
        is_online <- map["is_online"]
        is_armed <- map["is_armed"]
        cameras_group_id <- map["cameras_group_id"]
    }
}

//MARK: shared_cameras
//not used
class SharedCameras: Mappable {
    required init?(map: Map) {
    }

    func mapping(map: Map) {
    }
}

//MARK: cameras_groups
class CamerasGroups: Mappable {

    var id: Int?
    var name: String?
    var path: String?
    var root_id: Int?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        path <- map["path"]
        root_id <- map["root_id"]
    }
}
