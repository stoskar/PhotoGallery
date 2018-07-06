//
//  MenuTableViewController.swift
//  PhotoGallery
//
//  Created by IOS Developer6 on 02/07/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController {
    
    @IBOutlet weak var menuTblView: UITableView!
    let menuViewModel = MenuTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTblView.dataSource = menuViewModel
        self.menuTblView.delegate = menuViewModel
        menuViewModel.delegate = self
        menuTblView.register(UINib.init(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        menuTblView.separatorStyle = .none

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MenuTableViewController : MenuTableViewModelDelegate {
    func present() {
//        let asd = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FolderViewController") as! FolderViewController
//        self.present(asd, animated: true, completion: nil)
        self.performSegue(withIdentifier: "FolderViewSegue", sender: nil)
        
    }
    
    
}
