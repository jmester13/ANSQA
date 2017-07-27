//
//  CustomImage.swift
//  ANS QA
//
//  Created by Douglas Spencer on 12/22/16.
//  Copyright © 2016 Douglas Spencer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor =  UIColor.black.cgColor
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.8
    }
    

}
