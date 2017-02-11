//
//  CheckBoxButton.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 11.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://stackoverflow.com/a/27721995/6643923

import UIKit

@IBDesignable
class CheckBoxButton: UIButton {

    @IBInspectable var checkedStateImage: UIImage?
    var borderColor: UIColor? = UIColor.red {
        didSet {
            checkBoxImageView?.borderColor = borderColor
        }
    }

    var isChecked: Bool = false {
        didSet {
            if isChecked {
                checkBoxImageView?.cImage = self.checkedStateImage
            } else {
                checkBoxImageView?.cImage = UIImage()
            }
        }
    }

    private var checkBoxImageView: CheckBoxImageView?

    override init(frame: CGRect) {

        super.init(frame: frame)

        setDefaultData()

        // set other operations after super.init, if required
        self.addTarget(self, action: #selector(switchState), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setDefaultData()

        // set other operations after super.init, if required
        self.addTarget(self, action: #selector(switchState), for: .touchUpInside)
    }

    func switchState() {
        self.isChecked = !self.isChecked
        self.sendActions(for: .valueChanged)
    }

    func setDefaultData() {

        checkBoxImageView = CheckBoxImageView.init(frame: CGRect(x: 0,
                                                                 y: 0,
                                                                 width: frame.size.width,
                                                                 height: frame.size.height),
                                                   borderColor: borderColor,
                                                   rootView: self)

        self.insertSubview(checkBoxImageView!, belowSubview: self)

    }
}

extension CheckBoxButton: ViewConnectionProtocol {

    internal func tapRecognized() {
        switchState()
    }
}
