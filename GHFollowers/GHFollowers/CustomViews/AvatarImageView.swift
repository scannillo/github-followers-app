//
//  AvatarImageView.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/17/21.
//

import UIKit

class AvatarImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = UIImage(named: "avatar-placeholder")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
