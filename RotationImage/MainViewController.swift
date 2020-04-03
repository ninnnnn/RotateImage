//
//  ViewController.swift
//  RotationImage
//
//  Created by Ninn on 2020/4/3.
//  Copyright © 2020 Ninn. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var finalImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    var seletedImage: UIImage?
    
    @IBAction func cameraBtnClick(_ sender: Any) {
        self.getPhoneWithKind("Camera")
    }
    
    @IBAction func photoBtnClick(_ sender: Any) {
        self.getPhoneWithKind("Photo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    }
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func getPhoneWithKind(_ kind: String) {
        /// - Parameter kind: 1 = Camera, 2 = Photo
        switch kind {
        case "Camera":
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                alert(message: "Camera can't run!", title: "Nooooooooo!", handler: nil)
            }
        default:
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            seletedImage = image
        }
        imagePicker.dismiss(animated: true) {
            let presentVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: RotateViewController.identifier) as? RotateViewController
            presentVC?.delegate = self
            presentVC?.holderImage = self.seletedImage
            self.show(presentVC!, sender: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}

extension MainViewController: FinalImageDelegate {
    func setFinalImage(image: UIImage) {
        finalImageView.image = image
    }
}
