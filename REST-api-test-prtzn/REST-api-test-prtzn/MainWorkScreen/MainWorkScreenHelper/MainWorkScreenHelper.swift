//
//  MainWorkScreenHelper.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import Foundation
import ObjectMapper

struct MainWorkScreenHelper {

    static func createUsefulDataForMainWorkScreenTable(dataOfDevices: DevicesList) -> [TableCell]? {

        var valueForReturn:[TableCell]? = []

        followModelCollectDataForTable(arrayOfData: &valueForReturn!, folder: dataOfDevices.user_cameras)

        //and now - button section
        if let buttonObj = CellHelper.createObjectData(for: .button, dataObject: nil) {
            valueForReturn?.append(buttonObj)
        }

        return valueForReturn
    }

    static private func followModelCollectDataForTable(arrayOfData: inout [TableCell],
                                               folder userCameras:UserCameras?) {

        guard let cUserCameras = userCameras else { return }

        //camera without folder
        if let arrayCameras = cUserCameras.cameras {
            for camera in arrayCameras {

                if let elementObj = CellHelper.createObjectData(for: .cell, dataObject: camera) {
                    arrayOfData.append(elementObj)
                }
            }
        }

        //cameras in folder
        if let arrayFolders = cUserCameras.folders {
            for folder in arrayFolders {
                //first of all = add folder
                if let folderObj = CellHelper.createObjectData(for: .folder, dataObject: folder) {
                    arrayOfData.append(folderObj)
                }

                //this object is user_cameras type
                followModelCollectDataForTable(arrayOfData: &arrayOfData, folder: folder)

            }
        }
    }
}

//MARK:

//https://github.com/ochococo/Design-Patterns-In-Swift#-factory-method

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

    private var cameras_group_name: String = ""
    private var cameras_group_id: Int = 0

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

    private var storage_enabled: Bool = false
    private var camera_id: Int = 0
    private var device_id: Int = 0
    private var camera_name: String = ""
    private var is_active: Bool = false
    private var is_online: Bool = false
    private var is_armed: Bool = false
    private var cameras_group_id: Int = 0


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


////https://github.com/ochococo/Design-Patterns-In-Swift#-abstract-factory
//
//protocol TableCell {
////    func stringValue() -> String
//    // factory
//    static func make(dataObject : Mappable) -> TableCell
//}
//
//struct ButtonCell: TableCell {
////    private var dataObject: Mappable
//
//    // factory
//    static func make(dataObject: Mappable) -> TableCell {
//        return ButtonCell()
//    }
//}
//
//struct FolderCell: TableCell {
////    private var dataObject: UserCameras
//
//    private var cameras_group_name: String = ""
//    private var cameras_group_id: Int = 0
//
//    //    func stringValue() -> String { return nextStepNumber.stringValue }
//
//    // factory
//    static func make(dataObject : Mappable) -> TableCell {
//
//        if let dataObjectFolder =  dataObject as? UserCameras {
//            return FolderCell(cameras_group_name: dataObjectFolder.cameras_group_name ?? "",
//                              cameras_group_id: dataObjectFolder.cameras_group_id ?? 0
////                              ,dataObject: dataObjectFolder
//            )
//        }
//
//    }
//}
//
//
//struct DetailCell: TableCell {
////    private var dataObject: Camera
//
//    private var storage_enabled: Bool = false
//    private var camera_id: Int = 0
//    private var device_id: Int = 0
//    private var camera_name: String = ""
//    private var is_active: Bool = false
//    private var is_online: Bool = false
//    private var is_armed: Bool = false
//    private var cameras_group_id: Int = 0
//
////    func stringValue() -> String { return "\(swiftInt)" }
//
//    // factory
//    static func make(dataObject : Mappable) -> TableCell {
//
//        if let dataObjectCamera =  dataObject as? Camera {
//            return DetailCell(storage_enabled: dataObjectCamera.storage_enabled ?? false,
//                              camera_id: dataObjectCamera.camera_id ?? 0,
//                              device_id: dataObjectCamera.device_id ?? 0,
//                              camera_name: dataObjectCamera.camera_name ?? "",
//                              is_active: dataObjectCamera.is_active ?? false,
//                              is_online: dataObjectCamera.is_online ?? false,
//                              is_armed: dataObjectCamera.is_armed ?? false,
//                              cameras_group_id: dataObjectCamera.cameras_group_id ?? 0
////                              ,dataObject: dataObjectCamera
//            )
//        }
//    }
//}
//
////Abstract factory
//enum CellType {
//    case button, folder, cell
//}
//
//typealias CellFactory = (Mappable) -> TableCell
//
//enum CellHelper {
//    static func factory(for type: CellType) -> CellFactory {
//        switch type {
//        case .button:
//            return ButtonCell.make
//        case .folder:
//            return FolderCell.make
//        case .cell:
//            return DetailCell.make
//        }
//    }
//}
