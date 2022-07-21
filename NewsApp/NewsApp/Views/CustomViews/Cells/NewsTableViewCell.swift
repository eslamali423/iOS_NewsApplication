//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    //MARK:- Vars
    static let identifier = "NewsTableViewCell"
    
    private let newsImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: "heart")
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemPink
        return image
    }()
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    public let descriptionLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = .gray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    private let personImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "person.png")
        image.clipsToBounds = true
        image.tintColor = .systemPink
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    public let authorNameLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Author name"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    public let dateLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "description"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    private let stackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    
    //MARK:- Life Cycle
    override  init(style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        backgroundColor = .clear
        setupViews()
        configureConstrains()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //MARK:- Layouts and Cosntraints 
    private func setupViews(){
        contentView.addSubview(newsImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(personImageView)
        stackView.addArrangedSubview(authorNameLabel)
        stackView.addArrangedSubview(dateLabel)
        contentView.addSubview(stackView)

    }
    
    private func configureConstrains(){
        NSLayoutConstraint.activate([
        
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            newsImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            newsImageView.widthAnchor.constraint(equalToConstant: 130),
            newsImageView.heightAnchor.constraint(equalToConstant: 130),
            
            titleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor,constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),


           descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 2),
           descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
           descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            
            personImageView.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            personImageView.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -4),
            personImageView.widthAnchor.constraint(equalToConstant: 20),
            personImageView.heightAnchor.constraint(equalToConstant: 20),
        
            stackView.centerYAnchor.constraint(equalTo: personImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor,constant: 2),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -2)
            

        ])
    }
    
    //MARK:- Cell Configuration
    func configureCell(model: Article){
     
        if model.author == nil {
            self.authorNameLabel.text = "Unknown"

        }else {
            self.authorNameLabel.text = model.author

        }
        
        self.descriptionLabel.text = model.description
        self.titleLabel.text = model.title
        self.dateLabel.text = model.publishedAt
        if let url = URL(string: model.urlToImage) {
        self.newsImageView.sd_setImage(with: url, completed: nil)
        }else {
            self.newsImageView.image = UIImage(systemName: "note.text")
        }
        
    }
    
}
