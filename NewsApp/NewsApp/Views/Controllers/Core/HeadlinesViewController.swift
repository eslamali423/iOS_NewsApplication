//
//  HeadlinesViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import UIKit
import RxSwift
import RxCocoa


class HeadlinesViewController: UIViewController {

    //MARK:- Vars
    var headlinesViewModel = HeadlinesViewModell()
    var disposeBag = DisposeBag()
    
    private let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //   layout.itemSize = CGSize(width: 220, height: 300)
        
        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.register(HeadlineCollectionViewCell.self, forCellWithReuseIdentifier: HeadlineCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        getdata()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 20, y: 0, width: view.frame.size.width - 40, height: view.frame.size.height)
        
    }
    
    //MARK:- get Data
    func getdata(){
        headlinesViewModel.getHeadlines { [weak self](isSuccess) in
            if isSuccess {
                print("DONE HEADLINES")
                self?.bindCollecnView()
            }
        }
        
    }
    
    //MARK:- Binding collectionView
    func bindCollecnView(){
        headlinesViewModel.headlinesBehaviorSubject.bind(to: collectionView.rx.items(cellIdentifier: HeadlineCollectionViewCell.identifier, cellType: HeadlineCollectionViewCell.self)) { row ,item , cell in
            
            cell.configureCell(model: item)
        }
        
        collectionView.rx.modelSelected(Article.self).subscribe(onNext: { [weak self] (model) in
          
            guard let url = URL(string: model.url) else {return}
            let vc = WebViewViewController(url: url, title: model.author ?? "")
            let navigation = UINavigationController(rootViewController: vc)
            self?.present(navigation, animated: true)
            
                }).disposed(by: disposeBag)
        
    }

}

//MARK:- Extension for CollectionView Functions
extension HeadlinesViewController :  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: view.frame.size.width / 2.5, height: 300)

      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        }
    
    
    
    
    
    }
