//
//  HeaderView.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import UIKit

class HeaderView: UIView {
    
    //MARK:- Vars
    private let profileButton : UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(systemName: "person",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight : .bold)
        
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.tintColor = .systemPink
        button.layer.cornerRadius = 30
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .left
        label.text = "Welcome Back Again"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    public let nameLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Eslam Ali"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    private let stackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private let settingButton : UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(systemName: "gearshape",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight : .bold)
        
        button.layer.borderWidth = 0.1
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.tintColor = .systemPink
        button.layer.cornerRadius = 30
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder =  "Search about anything.."
        search.layer.borderWidth = 0.2
        search.layer.borderColor = UIColor.systemPink.cgColor
        search.layer.cornerRadius = 15
        search.searchTextField.backgroundColor = .clear
        return search
    }()
    
    
    
    //MARK:- Initlizaers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        self.clipsToBounds = true
        
        setupViews()
        configureConstraints()
        
        //          addSubview(titleLabel)
        //          addSubview(collectionView)
        
        
        
        
        
        //          bindCollectionView(albums: albums)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews(){
        addSubview(profileButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(nameLabel)
        addSubview(stackView)
        addSubview(settingButton)
        addSubview(searchBar)
        
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
           profileButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
           profileButton.topAnchor.constraint(equalTo: topAnchor,constant: 20),
           profileButton.widthAnchor.constraint(equalToConstant: 60 ),
           profileButton.heightAnchor.constraint(equalToConstant: 60 ),

            stackView.leadingAnchor.constraint(equalTo: profileButton.trailingAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor),
            
            settingButton.topAnchor.constraint(equalTo: profileButton.topAnchor),
            settingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            settingButton.widthAnchor.constraint(equalToConstant: 60 ),
            settingButton.heightAnchor.constraint(equalToConstant: 60 ),
            
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchBar.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
}
