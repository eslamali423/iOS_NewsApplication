//
//  HeadlineCollectionViewCell.swift
//  NewsApp
//
//  Created by Eslam Ali  on 21/07/2022.
//

import UIKit
import SDWebImage

class HeadlineCollectionViewCell: UICollectionViewCell {
   //MARK:- Vars
    static let identifier = "HeadlineCollectionViewCell"

    private let headlineImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.tintColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    private let personImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "person.png")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    public let authorNameLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    //MARK:- Initilizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        setupLayouts()
        configureConstraints()
    }
    

    required init?(coder: NSCoder) {
        fatalError()
    }
  //MARK:- Layouts / Constraints
    private func setupLayouts(){
        contentView.addSubview(headlineImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(personImageView)
        contentView.addSubview(authorNameLabel)
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = .zero
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOpacity = 0.3
       
        

    }
    
   
    private func configureConstraints(){
        NSLayoutConstraint.activate([
        
            headlineImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headlineImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headlineImageView.heightAnchor.constraint(equalToConstant: 150),
            headlineImageView.widthAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: headlineImageView.bottomAnchor,constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            
            
            
            personImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            personImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            personImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),

            personImageView.widthAnchor.constraint(equalToConstant: 20),
            personImageView.heightAnchor.constraint(equalToConstant: 20),
            
           authorNameLabel.centerYAnchor.constraint(equalTo: personImageView.centerYAnchor),
           authorNameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor,constant: 2),
           authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10)
           
        
        ])
    }
    
    //MARK:- Cell Configuration
    func configureCell(model: Article){
     
        if model.author == nil {
            self.authorNameLabel.text = "Unknown"

        }else {
            self.authorNameLabel.text = model.author

        }
        
       
        self.titleLabel.text = model.title
        
        if let url = URL(string: model.urlToImage ?? "") {
        self.headlineImageView.sd_setImage(with: url, completed: nil)
        }else {
            self.headlineImageView.image = UIImage(systemName: "note.text")
        }
        
    }
}


