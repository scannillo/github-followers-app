//
//  UserInfoHeaderViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/29/21.
//

import UIKit

class UserInfoHeaderViewController: UIViewController {
    
    let avatarImageView = AvatarImageView(frame: .zero)
    let usernameLabel = TitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = SecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = SecondaryTitleLabel(fontSize: 18)
    let bioLabel = BodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        layoutUI()
        configureUIElements()
    }
    
    func addSubViews() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? "N/A"
        locationLabel.text = user.location ?? "N/A"
        bioLabel.text = user.bio ?? "N/A"
        locationImageView.image = UIImage(systemName: SFSymbols.locationPin)
        locationImageView.tintColor = .systemGreen
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            bioLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

}
