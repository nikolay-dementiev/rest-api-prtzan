//
//  MainWorkScreenTableViewCell.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 09.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class MainWorkScreenTableViewCell: UITableViewCell {

    var tableCellData: TableCell?
    let classController = MainWorkScreenTableViewCellVC()
    var cellDelegate: MainWorkScreenCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
