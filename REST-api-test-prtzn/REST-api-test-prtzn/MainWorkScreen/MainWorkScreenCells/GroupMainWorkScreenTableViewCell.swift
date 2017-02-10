//
//  GroupMainWorkScreenTableViewCell.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//
import UIKit

class GroupMainWorkScreenTableViewCell: MainWorkScreenTableViewCell {
    @IBOutlet weak var groupeImage: UIImageView!
    @IBOutlet weak var groupeNameLabel: UILabel!
    @IBOutlet weak var groupeSettingsButton: UIButton!

    @IBAction func groupeSettingsButtonPressed(_ sender: UIButton) {
    }

    override var tableCellData: TableCell? {
        didSet {
            if let tableCellDataFolder = tableCellData as? FolderCell {
                //need to calculate correct image!!
                groupeImage.image = UIImage(named: "group_open_act")

                groupeNameLabel.text = tableCellDataFolder.cameras_group_name
            }

        }
    }

}
