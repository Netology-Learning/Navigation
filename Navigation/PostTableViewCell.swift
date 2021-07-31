//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Mikhail Belokhvostov on 27.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    var posting: Posting? {
        didSet {
            authorLable.text = posting?.author
            descriptionLable.text = posting?.description
            likesLable.text = "Likes:" + String(posting!.likes)
            viewsLable.text = "Views:" + String(posting!.views)
            postImageView.image = posting?.image
        }
    }
    
    private let authorLable: UILabel = {
        let authorLable = UILabel()
        authorLable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLable.textColor = .black
        authorLable.numberOfLines = 2
        authorLable.translatesAutoresizingMaskIntoConstraints = false
        return authorLable
    }()
    
    private let descriptionLable: UILabel = {
        let descriptionLable = UILabel()
        descriptionLable.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        descriptionLable.textColor = .systemGray
        descriptionLable.numberOfLines = 0
        
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLable
    }()
    
    private let likesLable: UILabel = {
        let likesLable = UILabel()
        likesLable.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        likesLable.textColor = .black
        likesLable.translatesAutoresizingMaskIntoConstraints = false
        return likesLable
    }()
    
    private let viewsLable: UILabel = {
        let viewsLable = UILabel()
        viewsLable.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        viewsLable.textColor = .black
        viewsLable.translatesAutoresizingMaskIntoConstraints = false
        return viewsLable
    }()
    
    private let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PostTableViewCell {
    func setupViews() {
        contentView.addSubview(authorLable)
        contentView.addSubview(descriptionLable)
        contentView.addSubview(likesLable)
        contentView.addSubview(viewsLable)
        contentView.addSubview(postImageView)
        
        let constraints = [
            authorLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            authorLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            authorLable.heightAnchor.constraint(equalToConstant: 30),

            
            postImageView.topAnchor.constraint(equalTo: authorLable.bottomAnchor, constant: 10),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            descriptionLable.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 10),
            descriptionLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            likesLable.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 10),
            likesLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            likesLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            viewsLable.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 10),
            viewsLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            viewsLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
