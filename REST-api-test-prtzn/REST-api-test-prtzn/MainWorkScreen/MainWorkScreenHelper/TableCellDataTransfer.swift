//
//  TableCellDataTransfer.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 10.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

//https://github.com/ochococo/Design-Patterns-In-Swift#-factory-method

import ObjectMapper

protocol TableCell {
    var cellType:CellType {get}

    static func make(dataObject : Mappable?) -> TableCell?
}

struct ButtonCell: TableCell {
    let cellType = CellType.button

    static func make(dataObject: Mappable?) -> TableCell? {
        return ButtonCell()
    }
}

struct FolderCell: TableCell {
    //    private var dataObject: UserCameras
    let cellType = CellType.folder

    var cameras_group_name: String = ""
    var cameras_group_id: Int = 0

    static func make(dataObject : Mappable?) -> TableCell? {

        if let dataObjectFolder =  dataObject as? UserCameras {
            return FolderCell(cameras_group_name: dataObjectFolder.cameras_group_name ?? "",
                              cameras_group_id: dataObjectFolder.cameras_group_id ?? 0
                //                              ,dataObject: dataObjectFolder
            )
        }
        return nil
    }
}


struct DetailCell: TableCell {

    //    private var dataObject: Camera
    let cellType = CellType.cell

    var storage_enabled: Bool = false
    var camera_id: Int = 0
    var device_id: Int = 0
    var camera_name: String = ""
    var is_active: Bool = false
    var is_online: Bool = false
    var is_armed: Bool = false
    var cameras_group_id: Int = 0
//    var folder_name: String = ""
//
//    mutating func setFolderName(_ folderName: String) {
//        folder_name = folderName
//    }

    static func make(dataObject : Mappable?) -> TableCell? {

        if let dataObjectCamera =  dataObject as? Camera {
            return DetailCell(storage_enabled: dataObjectCamera.storage_enabled ?? false,
                              camera_id: dataObjectCamera.camera_id ?? 0,
                              device_id: dataObjectCamera.device_id ?? 0,
                              camera_name: dataObjectCamera.camera_name ?? "",
                              is_active: dataObjectCamera.is_active ?? false,
                              is_online: dataObjectCamera.is_online ?? false,
                              is_armed: dataObjectCamera.is_armed ?? false,
                              cameras_group_id: dataObjectCamera.cameras_group_id ?? 0
//                              ,folder_name: ""
                //                              ,dataObject: dataObjectCamera
            )
        }
        return nil
    }
}

//Factory
enum CellType {
    case button, folder, cell
}

enum CellHelper {
    static func createObjectData(for type: CellType,
                                 dataObject: Mappable?) -> TableCell? {
        switch type {
        case .button:
            return ButtonCell.make(dataObject: dataObject)
        case .folder:
            return FolderCell.make(dataObject: dataObject)
        case .cell:
            return DetailCell.make(dataObject: dataObject)
        }
    }
}
