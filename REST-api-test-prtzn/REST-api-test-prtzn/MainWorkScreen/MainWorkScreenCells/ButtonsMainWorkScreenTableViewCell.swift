//
//  ButtonsMainWorkScreenTableViewCell.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class ButtonsMainWorkScreenTableViewCell: MainWorkScreenTableViewCell {

    @IBOutlet weak var buttonsAddGroupButton: UIButton!
    @IBOutlet weak var buttonsAddDeviceButton: UIButton!

    @IBAction func buttonsAddGroupButtonPressed(_ sender: UIButton) {
    }

    @IBAction func buttonsAddDeviceButtonPressed(_ sender: UIButton) {
    }

    override var tableCellData: TableCell? {
        didSet {
            //nothing to do yet
        }
    }
    
}
