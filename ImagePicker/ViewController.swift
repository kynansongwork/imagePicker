//
//  ViewController.swift
//  ImagePicker
//
//  Created by Kynan Song on 11/05/2018.
//  Copyright © 2018 Kynan Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    
    let pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        
        
    }
    
    @IBAction func pickImage(_ sender: Any) {
        pickerController.allowsEditing = false
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        //used to present the image picker.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.contentMode = .scaleAspectFit
            //Tells the image to fit to the view.
            imagePickerView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
        // Dismisses image picker/ modally presented view.
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        //Cancels image picker when user presses Cancel.
    }
    
    //Learnt from Udacity and http://www.codingexplorer.com/choosing-images-with-uiimagepickercontroller-in-swift/
    
}

