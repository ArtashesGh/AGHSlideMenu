//
//  MenuViewController.swift
//  AGHSlideMenu
//
//  Created by Artashes Ghazaryan on 5/20/19.
//  Copyright © 2019 Artashes Ghazaryan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var contentTableView: UITableView!
    
    let cellID = "MenuOptionTableViewCell"
    let menuItems = [  MenuOptions.state1,   MenuOptions.state2,   MenuOptions.state3,   MenuOptions.state4,   MenuOptions.state5,   MenuOptions.state6,  MenuOptions.state7,   MenuOptions.state8,   MenuOptions.state9]
    var menuSelectionClosure: ((  MenuOptions, Bool)-> Void)!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

//MARK: UITableViewDelegate

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuItem = self.menuItems[indexPath.row]
        self.menuSelectionClosure(menuItem, true)
    }
    
}

//MARK: UITableViewDataSource

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let menuItem = self.menuItems[indexPath.row]
        
        cell.textLabel?.text = menuItem.menuTitle
        cell.textLabel?.textColor = .white
        return cell
    }
    
}

