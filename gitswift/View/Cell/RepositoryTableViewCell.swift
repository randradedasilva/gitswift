//
//  RepositoryTableViewCell.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class RepositoryTableViewCell: UITableViewCell, Reusable, CodeView {
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init: coder has not been implemented")
    }
    
    // MARK: - Public Properties
    
     let mainImageView: UIImageView = {
        var mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.contentMode = UIView.ContentMode.scaleAspectFit
        return mainImage
        
    }()
    
     let nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
        
    }()
    
     let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
     let ownerLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
        
    }()
    
     let starCountLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
     let descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Public Methods
    
    func buildHierarchy() {
      
        addSubview(mainImageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ownerLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(starCountLabel)
        
    }
    
    func buildConstraints() {
        
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: self.stackView.heightAnchor, constant: 10).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
     
        stackView.leftAnchor.constraint(equalTo: self.mainImageView.rightAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        
    }
    
    func configure(with cellModel:RepositoryCellViewModel) {
        
        nameLabel.text = cellModel.name
        descriptionLabel.text = cellModel.description
        starCountLabel.text = "⭐️: \(cellModel.starsCount ?? "")"
        
        if let owner = cellModel.owner {
            ownerLabel.text = owner.login
        }
        
        if let posterPath = cellModel.owner?.avatar_url {
            
            self.mainImageView.kf.setImage(with: URL(string: posterPath))
            self.mainImageView.kf.indicatorType = .activity
            
        }
    }
}
