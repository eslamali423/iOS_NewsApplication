//
//  HeaderCollectionReusableView.swift
//  NewsApp
//
//  Created by Eslam Ali  on 22/07/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    //MARK:- Vars
    
    static let identifier = "HeaderCollectionReusableView"
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .left
        label.text = "Hottest News"
        label.backgroundColor = .green
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //   layout.itemSize = CGSize(width: 220, height: 300)

        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.register(HeadlineCollectionViewCell.self, forCellWithReuseIdentifier: HeadlineCollectionViewCell.identifier)
        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemYellow
        addSubview(titleLabel)
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
    //MARK:- Layouts / Constraints
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 20, y: 20, width: frame.width - 40, height: frame.height - 40)
        collectionView.frame = CGRect(x: 0, y: titleLabel.frame.height + 10, width: bounds.width - 10, height: bounds.height - 60)
 
    }
    
    
}
