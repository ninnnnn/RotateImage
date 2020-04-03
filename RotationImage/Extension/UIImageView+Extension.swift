//
//  UIImage+Extension.swift
//  RotationImage
//
//  Created by Ninn on 2020/4/3.
//  Copyright © 2020 Ninn. All rights reserved.
//

import UIKit

extension UIImageView {
    func rotate(imageView: UIImageView, degree: CGFloat) {
        imageView.transform = imageView.transform.rotated(by: degree)
    }
}
