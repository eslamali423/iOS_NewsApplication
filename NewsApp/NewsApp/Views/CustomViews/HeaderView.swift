//
//  HeaderView.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import UIKit

class HeaderView: UIView {
    
    //MARK:- Vars
    
    var delegate : ButtonActionsDelegate?
    
    private let personImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "person.png")
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        image.tintColor = .systemPink
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .left
        label.text = "WELCOME_LABEL_TITLE".localized(forLanguageCode: NSLocale.preferredLanguages[0])
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    public let nameLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "NAME_LABEL_TITLE".localized(forLanguageCode: NSLocale.preferredLanguages[0])
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
        
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.tintColor = .systemPink
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(didTabSettingsButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "SEARCH_PLACEHOLDER".localized(forLanguageCode: NSLocale.preferredLanguages[0])
        search.layer.borderWidth = 0.7
        search.layer.borderColor = UIColor.systemPink.cgColor
        search.layer.cornerRadius = 15
        search.searchTextField.backgroundColor = .clear
        return search
    }()
    
 
    
    //MARK:- Initlizaers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        self.clipsToBounds = true
        
        setupViews()
        configureConstraints()
        
  
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

    //MARK:- Layouts and Constraints
    private func setupViews(){
        addSubview(personImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(nameLabel)
        addSubview(stackView)
        addSubview(settingButton)
        addSubview(searchBar)
        
        searchBar.delegate = self
    }
    
    
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            personImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            personImageView.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            personImageView.widthAnchor.constraint(equalToConstant: 60 ),
            personImageView.heightAnchor.constraint(equalToConstant: 60 ),

            stackView.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: personImageView.centerYAnchor),
            
            settingButton.topAnchor.constraint(equalTo: personImageView.topAnchor),
            settingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            settingButton.widthAnchor.constraint(equalToConstant: 60 ),
            settingButton.heightAnchor.constraint(equalToConstant: 60 ),
            
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            searchBar.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 20),
            searchBar.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    //MARK:- Settings Buttons Action
    @objc private func didTabSettingsButton (){
        delegate?.didTabSettingsButton()
       
    }
}


extension HeaderView: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.didChangeSearchBar(text : searchText)
    }
}
