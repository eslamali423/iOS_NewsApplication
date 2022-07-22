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
        
        vc1.title = "HOME_LABEL_TITLE".localized(forLanguageCode: NSLocale.preferredLanguages[0])
        vc2.title = "HEADLINES_LABEL_TITLE".localized(forLanguageCode: NSLocale.preferredLanguages[0])
        
        tabBar.tintColor = .systemPink
        
        setViewControllers([vc1,vc2], animated: false)

}

    
    
}
