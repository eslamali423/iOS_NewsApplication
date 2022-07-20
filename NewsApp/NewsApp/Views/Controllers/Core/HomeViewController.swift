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
        view.addSubview(tableView)
        tableView.delegate = self

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
        newsViewModel.getNews { [weak self](isSuccess) in
            self?.bindTableView()
        }
        }
    
    //MARK:- Binding TableView
    func bindTableView(){
        newsViewModel.newsBehaviorSubject.bind(to: tableView.rx.items(cellIdentifier: NewsTableViewCell.identifier, cellType: NewsTableViewCell.self)) { row ,item , cell in
        
            cell.configureCell(model: item)
        }
    }
    
    //MARK:- Customize Loading Indicator
    private func showProgress(){
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.colorAnimation = .systemPink
        ProgressHUD.show()
    }
}
   


}

//MARK:- extension for TableView Delegate
extension HomeViewController : UITableViewDelegate {

   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
