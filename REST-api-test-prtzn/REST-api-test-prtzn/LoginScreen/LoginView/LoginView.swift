//
//  LoginView.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 04.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//http://supereasyapps.com/blog/2014/12/15/create-an-ibdesignable-uiview-subclass-with-code-from-an-xib-file-in-xcode-6
//http://stackoverflow.com/a/36424842/6643923

import UIKit

@IBDesignable
class LoginView: UIView {

    // Our custom view from the XIB file
    @IBOutlet weak var mainView: UIView!

    override init(frame: CGRect) {
        // 1. setup any properties here

        // 2. call super.init(frame:)
        super.init(frame: frame)

        // 3. Setup view from .xib file
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here

        // 2. call super.init(coder:)
        super.init(coder: aDecoder)

        // 3. Setup view from .xib file
        xibSetup()
    }

    func xibSetup() {
        mainView = loadViewFromNib()

        guard mainView != nil else { return }

        // use bounds not frame or it'll be offset
        mainView.frame = bounds

        // Make the view stretch with containing view
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        mainView.translatesAutoresizingMaskIntoConstraints = true
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(mainView)
    }

    func loadViewFromNib() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
    
}
