//
//  MenuOptionManager.swift
//  AGHSlideMenu
//
//  Created by Artashes Ghazaryan on 5/20/19.
//  Copyright © 2019 Artashes Ghazaryan. All rights reserved.
//

import UIKit

enum  MenuOptions {
    case state1
    case state2
    case state3
    case state4
    case state5
    case state6
    case state7
    case state8
    case state9
    
    var menuTitle: String {
        return String(describing: self)
    }
    
}

class MenuOptionManager: NSObject {
    
    static let sharedInstance = MenuOptionManager()
    
    let slidingPanel: SlidingPanelViewController
    
    
    override init() {
        
        self.slidingPanel = SlidingPanelViewController()
        
        super.init()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let lefthamburgerMenuController :  MenuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as!  MenuViewController
        
        let detailController :  DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as!  DetailViewController
        let navigation = UINavigationController(rootViewController:detailController)
        
        self.slidingPanel.leftPanel = lefthamburgerMenuController
        self.slidingPanel.centerPanel = navigation
        
        lefthamburgerMenuController.menuSelectionClosure = {[weak self](selectedMenuOption:  MenuOptions, animated:Bool) in
            
            self?.showScreenForMenuOption(menuOntion: selectedMenuOption, animation: animated)
        }
    }
    
    func showScreenForMenuOption(menuOntion:  MenuOptions, animation animated: Bool) {

        let navigationController = self.slidingPanel.centerPanel as! UINavigationController
        let detailController = navigationController.viewControllers.first as!  DetailViewController
        detailController.stateLabel?.text = menuOntion.menuTitle
        
        self.slidingPanel.showCenterPanel(animated: animated)
        
    }
}
