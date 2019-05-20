//
//  DetailViewController.swift
//  AGHSlideMenu
//
//  Created by Artashes Ghazaryan on 5/20/19.
//  Copyright © 2019 Artashes Ghazaryan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    
    
    override func viewDidLoad() {
        self.navigationItem.title = "State"
        self.stateLabel?.text = MenuOptions.state1.menuTitle
    }
    
}
