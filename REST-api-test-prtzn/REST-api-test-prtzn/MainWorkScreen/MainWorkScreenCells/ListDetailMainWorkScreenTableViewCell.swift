//
//  ListDetailMainWorkScreenTableViewCell.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class ListDetailMainWorkScreenTableViewCell: MainWorkScreenTableViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailSettingsButton: UIButton!
    @IBOutlet weak var detailCameraLiveButton: UIButton!
    @IBOutlet weak var detailPlayBackButton: UIButton!

    @IBOutlet weak var detailImageLeadinConstraint: NSLayoutConstraint!

    @IBAction func detailSettingsButtonPressed(_ sender: UIButton) {
    }

    @IBAction func detailCameraLiveButtonPressed(_ sender: UIButton) {
    }

    @IBAction func detailPlayBackButtonPressed(_ sender: UIButton) {
    }

    override var tableCellData: TableCell? {
        didSet {

            if let tableCellDataDetail = tableCellData as? DetailCell {
                
                detailImage.image = classController.getCorrectImageForCamera(camemaIsArmed: tableCellDataDetail.is_armed,
                                                                             camemaIsActive: tableCellDataDetail.is_active)

                detailNameLabel.text = tableCellDataDetail.camera_name

                detailCameraLiveButton.setImage(
                    classController.getCorrectImageForCameraStatus(camemaIsOnline: tableCellDataDetail.is_online),
                    for: UIControlState.normal)
            }
        }
    }
    
}
