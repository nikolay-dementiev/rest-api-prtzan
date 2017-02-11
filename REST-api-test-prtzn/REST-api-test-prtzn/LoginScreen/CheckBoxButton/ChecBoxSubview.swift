//
//  ChecBoxSubview.swift
//  REST-api-test-prtzn
//
//  Created by Nikolay Dementiev on 11.02.17.
//  Copyright © 2017 mc373. All rights reserved.
//

// MARK:- SubView

import UIKit

protocol ViewConnectionProtocol {
    func tapRecognized()
}

//
class CheckBoxImageView: UIView {

    public var cImage: UIImage? {
        didSet {
            if let notNullImage = cImage, let notNullimageView = imageView {
                self.imageView?.image = imageWithImage(image: notNullImage,
                                                       scaledToSize: notNullimageView.frame.size)
            }
        }
    }

    private var imageView: UIImageView?
    var borderColor: UIColor? = UIColor.blue {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    private var rootViewButton: ViewConnectionProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(frame: CGRect,
                     borderColor: UIColor?,
                     rootView: ViewConnectionProtocol) {
        self.init(frame: frame)

        self.borderColor = borderColor
        self.rootViewButton = rootView

        didLoad()
    }

    private func didLoad() {

        setCurrentDefaultView()
        setCheckBoxView()

        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        addGestureRecognizer(gesture)
    }

    private func setCurrentDefaultView() {
        let selfBoundsSizeWidth = self.bounds.size.width * 0.8
        let oldCenter = CGPoint(x: frame.size.width  / 2,
                                y: frame.size.height / 2)
        frame = CGRect(x: frame.origin.x,
                       y: frame.origin.y,
                       width: selfBoundsSizeWidth,
                       height: selfBoundsSizeWidth)
        center = oldCenter

        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = 1;
        layer.cornerRadius = 0.5 * self.bounds.size.width
        clipsToBounds = true
    }

    private func setCheckBoxView() {

        let selfBoundsSizeWidth = self.bounds.size.width * 0.7

        imageView = UIImageView(frame: CGRect(x: frame.origin.x,
                                              y: frame.origin.y,
                                              width: selfBoundsSizeWidth,
                                              height: selfBoundsSizeWidth))
        if let notNullImageView = imageView {
            notNullImageView.center = CGPoint(x: frame.size.width  / 2,
                                              y: frame.size.height / 2)

            notNullImageView.layer.cornerRadius = self.bounds.size.width / 2
            notNullImageView.clipsToBounds = true

            notNullImageView.layer.borderColor = UIColor.clear.cgColor
            notNullImageView.layer.borderWidth = 1;

            self.addSubview(notNullImageView)
        }
    }


    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{

        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    func someAction(_ sender:UITapGestureRecognizer){
        rootViewButton?.tapRecognized()
    }
    
}
