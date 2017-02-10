//
//  MainWorkScreenTableViewCellVC.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 10.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

struct  MainWorkScreenTableViewCellVC {

    func getCorrectImageForCameraStatus(camemaIsOnline isOnline: Bool = false) -> UIImage? {
        return UIImage(named: isOnline ? "81x44-live" : "81x44-live")
    }

    func getCorrectImageForCamera(camemaIsArmed isArmed: Bool = false,
                                  camemaIsActive isActive: Bool = false) -> UIImage? {

        var imageForReturn:UIImage?

        var nameOfImage:String?

        if isArmed {
            if isActive {
                nameOfImage = "camera-act_shield-act"
            } else {
                nameOfImage = "camera-pass_shield-pass"
            }
        } else {
            //not armed
            if isActive {
                nameOfImage = "camera-act"
            } else {
                nameOfImage = "camera-pass"
            }
        }

        //"camera-red" // was ist das?

        if let imageNameForUse = nameOfImage {
            imageForReturn = UIImage(named: imageNameForUse)
        }

        return imageForReturn
    }
    
}
