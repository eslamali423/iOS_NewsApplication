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
        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.delegate = self
        setupCollectionView()
        
        getdata()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 20, y: 0, width: view.frame.size.width - 40, height: view.frame.size.height)
        
    }
    
    private func setupCollectionView(){
        collectionView.backgroundColor = .green
      
        collectionView.register(HeadlineCollectionViewCell.self, forCellWithReuseIdentifier: HeadlineCollectionViewCell.identifier)

        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: HeaderCollectionReusableView.identifier)
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
            vc.modalPresentationStyle = .fullScreen
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
    
 
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else {
            print("cant get the reusable view")
            return UICollectionReusableView()
        }
        headerView.frame = collectionView.bounds
        return headerView


    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    

    
    
    


}
