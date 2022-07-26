//
//  SettingsViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 21/07/2022.
//

import UIKit
import LanguageManager_iOS

class SettingsViewController: UIViewController {
    
    //MARK:- Vars
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
    
        view.addSubview(tableView)
    
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     title =   "SETTINGS_TITLE".localized(forLanguageCode: NSLocale.preferredLanguages[0])
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        configureButtons()
    }
    
    //MARK:- Configure NavBar Buttons
    private func configureButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem( image: UIImage(systemName: "chevron.backward") ,style: .done, target: self, action: #selector(didTabBackButton))

        navigationController?.navigationBar.tintColor = .systemPink

    }
    
    @objc private func didTabBackButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
}

//MARK:- Extension for Tableview Methods
extension SettingsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "cell")  else {
            return UITableViewCell()
        }
        cell.imageView?.image = UIImage(systemName: "globe",withConfiguration: UIImage.SymbolConfiguration(pointSize: 22))
        
        cell.textLabel?.text = "CHANGE_LANGUAGE".localized(forLanguageCode: NSLocale.preferredLanguages[0])
        cell.textLabel?.font = .systemFont(ofSize: 22)
        cell.tintColor = .systemPink
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let alert = UIAlertController(title: "CHANGE_LANGUAGE".localized(forLanguageCode: NSLocale.preferredLanguages[0]), message: "CHOOSE_LANGUAGE".localized(forLanguageCode: NSLocale.preferredLanguages[0]), preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "English", style: .default, handler: { [weak self] (action) in
            UserDefaults.standard.setValue(["en"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
            self?.changeLanguage(selectedLanguage: .en)
        }))
        alert.addAction(UIAlertAction(title: "العربية", style: .default, handler: { [weak self](action) in
            UserDefaults.standard.setValue(["ar"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            
            self?.changeLanguage(selectedLanguage: .ar)
        }))
        alert.addAction(UIAlertAction(title: "French", style: .default, handler: { [weak self](action) in
         
    
                UserDefaults.standard.setValue(["fr"], forKey: "AppleLanguages")
                UserDefaults.standard.synchronize()
                
                self?.changeLanguage(selectedLanguage: .fr )
          
           
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { [weak self](action) in
            self?.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    

    private   func changeLanguage (selectedLanguage :Languages?) {
        DispatchQueue.main.async {
            // change the language
            LanguageManager.shared.setLanguage(language: selectedLanguage ?? .en)
               {  title -> UIViewController in
                let vc = MainTabBarViewController()
                
                // the view controller that you want to show after changing the language
                return vc
               } animation: { view in
                 // do custom animation
                 view.transform = CGAffineTransform(scaleX: 2, y: 2)
                 view.alpha = 0
                
               }
        }
    
    }
 
}

