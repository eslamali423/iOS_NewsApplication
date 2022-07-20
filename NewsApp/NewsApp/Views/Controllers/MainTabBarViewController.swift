//
//  MainTabBarViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: HeadlinesViewController())
     
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "doc.append")
        
        vc1.title = "Home"
        vc2.title = "Headlines"
        
        tabBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        setViewControllers([vc1,vc2], animated: false)

}

}
