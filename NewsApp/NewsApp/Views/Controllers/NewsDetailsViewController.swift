//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import UIKit
import SDWebImage

class NewsDetailsViewController: UIViewController {
    
    //MARK:- Vars
    
    var article : Article!
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.isScrollEnabled = true
        return v
    }()
    
    let scrollContentView : UIView = {
        let view = UIView()
        
        return view
    }()
    
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "title"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
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
    
    public let authorNameLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .left
        label.text = "Author name"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    public let dateLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .gray
        label.textAlignment = .left
        label.text = "Date"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    private let stackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let newsImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: "heart")
        image.layer.cornerRadius = 15
        image.backgroundColor = .green
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemPink
        return image
    }()
    
 
    
    public let contentLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .gray
        label.text = "Content"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavBar()
        setupViews()
        configureConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 60, width: view.frame.size.width, height: view.frame.size.height)
        scrollContentView.frame = scrollView.bounds
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
    
    //MARK:- Navbar Configuration
    func configureNavBar()  {
        
        // set the logo in the center
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //  imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = UIImage(systemName: "note.text", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        
        let contentView = UIView()
        self.navigationItem.titleView = contentView
        self.navigationItem.titleView?.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        // set the left buton to the navBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .done, target: self, action: #selector(didTabBackButton))
        
    
        navigationController?.navigationBar.tintColor = .systemPink
    }
    
    @objc private func didTabBackButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- Layouts and Cosntraints
    private func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        
        scrollContentView.addSubview(titleLabel)
        scrollContentView.addSubview(personImageView)
        
        stackView.addArrangedSubview(authorNameLabel)
        stackView.addArrangedSubview(dateLabel)
        
        scrollContentView.addSubview(stackView)
        scrollContentView.addSubview(newsImageView)
        scrollContentView.addSubview(contentLabel)
    }
   
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor,constant: -16),
            titleLabel.topAnchor.constraint(equalTo: scrollContentView.topAnchor,constant: 50),

            personImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            personImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 60),
            personImageView.widthAnchor.constraint(equalToConstant: 60),
            
            stackView.centerYAnchor.constraint(equalTo: personImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor,constant: 10),
            stackView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor,constant: -10),
            
            newsImageView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            newsImageView.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 16),
            newsImageView.heightAnchor.constraint(equalToConstant: 300),
            newsImageView.widthAnchor.constraint(equalToConstant: view.frame.width - 50),

            contentLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            contentLabel.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
        ])
    }
    
    func configureView(model: Article){
        if model.author == nil {
            self.authorNameLabel.text = "Unknown"

        }else {
            self.authorNameLabel.text = model.author

        }
        self.contentLabel.text = model.content
        self.titleLabel.text = model.title
        self.dateLabel.text = model.publishedAt
        if let url = URL(string: model.urlToImage ?? "" ) {
        self.newsImageView.sd_setImage(with: url, completed: nil)
        }else {
            self.newsImageView.image = UIImage(systemName: "note.text")
        }
    }
    
    
    
}
