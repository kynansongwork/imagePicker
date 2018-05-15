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
        
        topTextBox.defaultTextAttributes = textViewDelegate.textAttributes
        bottomTextBox.defaultTextAttributes = textViewDelegate.textAttributes
        bottomTextBox.textAlignment = .center
        topTextBox.center = CGPoint(x:pickerController.view.bounds.size.width / 2.0, y:pickerController.view.bounds.size.height / 2.0)
        //Need to work out how to properly center text.
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscibeFromKeyboardNotification()
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
    
    //keyboard behaviours
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscibeFromKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide,object: nil)

    }
    
    //When called these functions will shift the viewframe.
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if bottomTextBox.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
        //Checks if the bottom text box is the first responder. If so, shift the view by the keyboard size.
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        if bottomTextBox.isFirstResponder {
            view.frame.origin.y += getKeyboardHeight(notification)
        }
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue //Of a CF Rectangle
        return keyboardSize.cgRectValue.height
    }
    
    
    
    //Learnt from Udacity, http://swiftlylearning.blogspot.co.uk and http://www.codingexplorer.com/choosing-images-with-uiimagepickercontroller-in-swift/
    

}

