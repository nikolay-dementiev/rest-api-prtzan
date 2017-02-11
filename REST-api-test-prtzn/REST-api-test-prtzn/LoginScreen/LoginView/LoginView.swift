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

    var loginViewControllerDelegat: LoginScreenProtocol? {
        didSet {
            emaiTextField.delegate = loginViewControllerDelegat
            passwordTextField.delegate = loginViewControllerDelegat
        }
    }

    @IBOutlet weak var appVersionLabel: UILabel!
    @IBOutlet weak var emaiLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emaiTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var demoButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var rememberButtonCLabel: CheckBoxLabel!
    @IBOutlet weak var rememberButtonC: CheckBoxButton!
    @IBOutlet weak var restoreButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!

    @IBAction func loginButtonPressed(_ sender: Any) {

        self.loginViewControllerDelegat?.logginUserOnServer(userName: emaiTextField.text!,
                                                            password: passwordTextField.text!,
                                                            getDevices: true)
    }

    @IBInspectable var textSize: Int = 16 {
        didSet {
            setFontSizeForElement(emaiLabel)
            setFontSizeForElement(passwordLabel)
            setFontSizeForElement(emaiTextField)
            setFontSizeForElement(passwordTextField)

            setFontSizeForElement(demoButton)
            setFontSizeForElement(loginButton)

            let corPoint:Int = -4
            setFontSizeForElement(rememberButtonC, corPoint: corPoint)
            setFontSizeForElement(rememberButtonCLabel, corPoint: -2)
            setFontSizeForElement(restoreButton, corPoint: corPoint)
            setFontSizeForElement(helpButton, corPoint: corPoint)
            setFontSizeForElement(registrationButton, corPoint: corPoint)
        }
    }

    // Our custom view from the XIB file
    @IBOutlet weak var mainView: UIView!

    override init(frame: CGRect) {
        // 1. setup any properties here

        // 2. call super.init(frame:)
        super.init(frame: frame)

        // 3. Setup view from .xib file
        xibSetup()
        setInitParameters()
    }

    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here

        // 2. call super.init(coder:)
        super.init(coder: aDecoder)

        // 3. Setup view from .xib file
        xibSetup()
        setInitParameters()
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

    //MARK: custom interface settings
    private func setInitParameters() {

        self.appVersionLabel.text = AppSettings.appVersion

        emaiTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.returnKeyType = UIReturnKeyType.done

        rememberButtonCLabel?.linkedViewButton = rememberButtonC
        rememberButtonC.borderColor = rememberButtonCLabel.textColor

//        emaiTextField.layer.borderWidth = 2.0
//        emaiTextField.layer.borderColor = emaiLabel.textColor.cgColor
//
//        passwordTextField.layer.borderWidth = 2.0
//        passwordTextField.layer.borderColor = passwordLabel.textColor.cgColor
    }

    private func setImageForButtons() {
        //#1
        // for normal state
        demoButton.setBackgroundImage(UIImage(named: "btn_green_unpressed.png"), for: UIControlState.normal)

        // for Selected state
        demoButton.setBackgroundImage(UIImage(named: "btn_green_pressed.png"), for: UIControlState.selected)
        // for Selected state
        demoButton.setBackgroundImage(UIImage(named: "btn_green_pressed.png"), for: UIControlState.highlighted)

        //#2
        // for normal state
        loginButton.setBackgroundImage(UIImage(named: "btn_blue_unpressed.png"), for: UIControlState.normal)

        // for Selected state
        loginButton.setBackgroundImage(UIImage(named: "btn_blue_pressed.png"), for: UIControlState.selected)
        // for Selected state
        loginButton.setBackgroundImage(UIImage(named: "btn_blue_pressed.png"), for: UIControlState.highlighted)
    }

    private func setFontSizeForElement(_ button: UIButton?,
                                       corPoint correctionPoint:Int = 0) {
        button?.titleLabel?.font = button?.titleLabel?.font.withSize(CGFloat(textSize + correctionPoint))
    }
    private func setFontSizeForElement(_ label: UILabel?,
                                       corPoint correctionPoint:Int = 0) {
        label?.font = label?.font.withSize(CGFloat(textSize + correctionPoint))
    }
    private func setFontSizeForElement(_ textField: UITextField?,
                                       corPoint correctionPoint:Int = 0) {
        textField?.font = textField?.font?.withSize(CGFloat(textSize + correctionPoint))
    }
    
    
}
