//
//  SectionView.swift
//  NewsApp
//
//  Created by Eslam Ali  on 21/07/2022.
//

import UIKit

class SectionView: UIView {

    //MARK:- Vars
    private let noteImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: "note.text")
        image.clipsToBounds = true
    
        image.tintColor = .systemPink
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    public let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.text =  "TOP_ARTICELS_LABEL".localized(forLanguageCode: NSLocale.preferredLanguages[0])
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.adjustsFontSizeToFitWidth = false
        return label
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
    
    
    //MARK:- Layout and Constraints
    private func setupViews(){
        addSubview(noteImageView)
        addSubview(titleLabel)
        
        
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
        
            noteImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            noteImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            noteImageView.widthAnchor.constraint(equalToConstant: 40),
            noteImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(equalTo: noteImageView.trailingAnchor,constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: noteImageView.centerYAnchor),
        
        ])
    }

}
