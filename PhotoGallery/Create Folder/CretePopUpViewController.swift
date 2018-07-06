//
//  CretePopUpViewController.swift
//  PhotoGallery
//
//  Created by IOS Developer6 on 05/07/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import UIKit

protocol CreateFolderDelgate {
    
    func createFolder(folderName:String) 
}


class CretePopUpViewController: UIViewController {

    @IBOutlet weak var createFolderTextFeild: UITextField!
    
    var delegate: CreateFolderDelgate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancleBtnAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okBtnAction(_ sender: UIButton) {
        
        print(createFolderTextFeild.text!)
        self.delegate?.createFolder(folderName: "Hello")
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
