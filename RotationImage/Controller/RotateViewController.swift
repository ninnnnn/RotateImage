//
//  RotateViewController.swift
//  RotationImage
//
//  Created by Ninn on 2020/4/3.
//  Copyright © 2020 Ninn. All rights reserved.
//

import UIKit

protocol FinalImageDelegate: AnyObject {
    func setFinalImage(image: UIImage)
}

class RotateViewController: UIViewController {

    @IBOutlet weak var seletedImage: UIImageView!
    var holderImage: UIImage?
    weak var delegate: FinalImageDelegate?
    
    @IBAction func rotateLeftBtnClick(_ sender: Any) {
        rotateDirection("left")
    }
    
    @IBAction func rotateRightBtnClick(_ sender: Any) {
        rotateDirection("right")
    }
    
    @IBAction func doneBtnClick(_ sender: Any) {
        delegate?.setFinalImage(image: holderImage!)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    func initView() {
        seletedImage.image = holderImage
    }
    
    func rotateDirection(_ dir: String) {
        var degree: CGFloat = 0.0
        switch dir {
        case "right":
            degree = CGFloat(Double.pi/2)
        default:
            degree = -CGFloat(Double.pi/2)
        }
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.4, delay: 0, options: .curveLinear, animations: {
            self.seletedImage.rotate(imageView: self.seletedImage, degree: degree)
        }, completion: nil)
        holderImage = holderImage?.rotate(radians: degree)
    }
}
