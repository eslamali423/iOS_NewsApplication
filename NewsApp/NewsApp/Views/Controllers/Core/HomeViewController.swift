//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import UIKit
import RxSwift
import RxCocoa
import ProgressHUD


class HomeViewController: UIViewController {
    
    //MARK:- Vars
    var newsViewModel = NewsViewModel()
    var disposeBag = DisposeBag()
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return table
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        view.addSubview(tableView)
        tableView.delegate = self
//        tableView.dataSource = self
        
        configureHeaderView()
        
        getNewsData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    
    //MARK:- Customize Header  for the TableView
    func configureHeaderView()  {
        let  headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 5))
        //    headerView.delegate = self
        tableView.tableHeaderView = headerView
        
    }
    
    
    //MARK:- Get News Data
    func getNewsData () {
        showProgress()
        newsViewModel.getNews { [weak self](isSuccess) in
            print("DONE HOME")
            self?.bindTableView()
            ProgressHUD.dismiss()
        }
    }
    
    //MARK:- Binding TableView
    func bindTableView(){
        newsViewModel.newsBehaviorSubject.bind(to: tableView.rx.items(cellIdentifier: NewsTableViewCell.identifier, cellType: NewsTableViewCell.self)) { row ,item , cell in
            
            cell.configureCell(model: item)
        }
        
        tableView.rx.modelSelected(Article.self).subscribe(onNext: { [weak self] (model) in
            
            
            let newsVC = NewsDetailsViewController()
            newsVC.configureView(model: model)
            let navigationController = UINavigationController(rootViewController: newsVC)
            navigationController.modalPresentationStyle = .fullScreen
            
            
            self?.present(navigationController, animated: true, completion: nil)
            
        }).disposed(by: disposeBag)
        
    }
    
    //MARK:- Customize Loading Indicator
    private func showProgress(){
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.colorAnimation = .systemPink
        ProgressHUD.show()
    }
}



//MARK:- extension for TableView Delegate
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as! NewsTableViewCell
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    // set the height for section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectioView = SectionView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: view.bounds.height))
        return sectioView
        
    }
    
    
    
}
