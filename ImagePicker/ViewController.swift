//
//  ViewController.swift
//  ImagePicker
//
//  Created by Kynan Song on 11/05/2018.
//  Copyright © 2018 Kynan Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagePickerView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func pickImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        present(pickerController, animated: true, completion: nil)
        //used to present the image picker.
    }
    
}

