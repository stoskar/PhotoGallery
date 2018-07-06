//
//  FolderViewController.swift
//  PhotoGallery
//
//  Created by IOS Developer6 on 02/07/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import UIKit

class FolderViewController: UIViewController {
let menuViewModel = MenuTableViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  collectionView.register(UINib.init(nibName: "FolderCollectionViewCell" , bundle: nil), forCellWithReuseIdentifier: "FolderCollectionViewCell")
        
        collectionView.register(UINib.init(nibName: "FolderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FolderCollectionViewCell")
        
    }
    
    
    
    @IBAction func methodCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func CreteFolderAction(_ sender: UIButton) {
        
        
//        let alert = UIAlertController(title: "Create Folder", message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        alert.addTextField(configurationHandler: { textField in
//            textField.placeholder = "Input your Folder name here..."
//        })
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//
//            if let name = alert.textFields?.first?.text {
//                print("Your name: \(name)")
//            }
//        }))
//
//        self.present(alert, animated: true)
        
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "CretePopUpViewController") as! CretePopUpViewController
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        myAlert.delegate = self
        self.present(myAlert, animated: true, completion: nil)
        

    }
    
}


extension FolderViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FolderCollectionViewCell", for: indexPath) as! FolderCollectionViewCell
        
        return cell
    }
    
}
extension FolderViewController:UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith(mainView: collectionView.superview!)
        return CGSize(width: width, height: width)
    }
    
    func calculateWith(mainView: UIView) -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(mainView.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (mainView.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
}

extension FolderViewController:CreateFolderDelgate{
    
    func createFolder(folderName: String) {
        
        print(folderName)
    }
    
}
