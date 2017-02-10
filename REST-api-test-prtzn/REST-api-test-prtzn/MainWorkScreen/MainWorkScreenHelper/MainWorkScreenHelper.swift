//
//  MainWorkScreenHelper.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

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

        //camera
        if let arrayCameras = cUserCameras.cameras {
            for camera in arrayCameras {

                if let elementObj = CellHelper.createObjectData(for: .cell, dataObject: camera) {

                    arrayOfData.append(elementObj)
                }
            }
        }

        //folder
        if let arrayFolders = cUserCameras.folders {
            for folder in arrayFolders {
                //first of all = add folder
                if let folderObj = CellHelper.createObjectData(for: .folder, dataObject: folder) {
                    arrayOfData.append(folderObj)
                }

                //cameras in folder
                //this object is user_cameras type
                followModelCollectDataForTable(arrayOfData: &arrayOfData, folder: folder)

            }
        }
    }
}
