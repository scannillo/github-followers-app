//
//  FollowerCollectionViewCell.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/17/21.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    var avatarImage = AvatarImageView(frame: .zero)
    var usernameLabel = TitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Why are using this set method? Would a custom initializer make more sense?
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImage.downloadImage(from: follower.avatarUrl)
    }
    
    func configureLayout() {
        addSubview(avatarImage)
        addSubview(usernameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding), // width
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
