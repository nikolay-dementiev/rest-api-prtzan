//
//  MainScreenTabBarController.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 11.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class MainScreenTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageView:UIImageView = UIImageView.init(image: UIImage(named: "2560x98px-DOWN.png"))
        imageView.sizeToFit()

        let imageSize:CGFloat = 15
        imageView.frame = CGRect.init(x: 0,
                                      y: self.view.frame.height - imageSize,
                                      width: self.view.frame.width,
                                      height: imageSize)
        self.view.addSubview(imageView)

        let xPosition = tabBar.frame.origin.x
        let yPosition = tabBar.frame.origin.y - imageSize
        let height = tabBar.frame.size.height
        let width = tabBar.frame.size.width

        tabBar.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
    }

}
