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
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextBox: UITextField!
    @IBOutlet weak var bottomTextBox: UITextField!
    
    let pickerController = UIImagePickerController()
    let textViewDelegate = TextViewDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        topTextBox.delegate = textViewDelegate
        bottomTextBox.delegate = textViewDelegate
        
        
        imagePickerView.contentMode = .scaleAspectFit
        topTextBox.textAlignment = .center
        bottomTextBox.textAlignment = .center
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        //Need to test on a device
    }
    
    @IBAction func pickImage(_ sender: Any) {
        pickerController.allowsEditing = false
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        //used to present the image picker.
    }
    
    @IBAction func cameraImage(_ sender: Any) {
        pickerController.allowsEditing = false
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //Optional type so needs to be unwrapped.
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

