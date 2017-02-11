//
//  CheckBoxLabel.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 11.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class CheckBoxLabel: UILabel {

    var linkedViewButton: ViewConnectionProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)

        didLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        didLoad()
    }

    private func didLoad() {

        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        gesture.numberOfTapsRequired = 1
        addGestureRecognizer(gesture)
        self.isUserInteractionEnabled = true
    }

    func someAction(_ sender:UITapGestureRecognizer){
        linkedViewButton?.tapRecognized()
    }
    
}
