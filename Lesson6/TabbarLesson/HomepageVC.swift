//
//  ViewController.swift
//  TabbarLesson
//
//  Created by Yakup on 17.09.2023.
//

import UIKit

class HomepageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabItems = tabBarController?.tabBar.items
        {
            let homepageItem = tabItems[0]
            let settingsItem = tabItems[1]
            homepageItem.badgeValue = "3"
            settingsItem.badgeValue = "Update"
        }
        
        let appearance = UITabBarAppearance()
        
    }


}

