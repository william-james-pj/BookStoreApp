//
//  TabBarHome.swift
//  wspr
//
//  Created by Pinto Junior, William James on 25/01/22.
//

import UIKit

class TabBarHome: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let profileVC = ProfileViewController()
        let cartVC = CartViewController()
        
        homeVC.title = "Home"
        profileVC.title = "Profile"
        cartVC.title = "Cart"
        
        self.setViewControllers([homeVC, cartVC, profileVC], animated: false)
        self.tabBar.tintColor = UIColor(red: 0.992, green: 0.439, blue: 0.078, alpha: 1)
        self.tabBar.barTintColor = UIColor(red: 0.223, green: 0.243, blue: 0.274, alpha: 1)

        guard let items = self.tabBar.items else { return }
        let icons = ["house.fill", "cart.fill", "person.fill"]
        
        for i in 0...2 {
            items[i].image = UIImage(systemName: icons[i])
        }
        
    }
}
