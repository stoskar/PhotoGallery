//
//  MenuTableModel.swift
//  PhotoGallery
//
//  Created by IOS Developer6 on 02/07/18.
//  Copyright © 2018 sachin. All rights reserved.
//

import UIKit

protocol MenuTableViewModelDelegate : class {
    
    func present()
}

class MenuTableViewModel: NSObject {
    
    var delegate:MenuTableViewModelDelegate!
    
    var menuArr = ["Photo","Video","Notes","Password","Themes","Setting"]
    
}

extension MenuTableViewModel:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.selectionStyle = .none
        cell.menuLable?.text = menuArr[indexPath.row]
        
        return cell
    }
    
}

extension MenuTableViewModel:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        //DispatchQueue.main.async {
        
            self.delegate.present()
        //}
    }
    
}



