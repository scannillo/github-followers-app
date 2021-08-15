//
//  SearchViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/14/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = LargeTextField()
    let getFollowersButton = LargeButton(backgroundColor: .systemGreen, title: "Get Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureImageView()
        configureTextField()
        configureGetFollowersButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureImageView() {
        view.addSubview(logoImageView) // NOTE: Have to add to subview before doing constraints
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40), // Y
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // X
            logoImageView.heightAnchor.constraint(equalToConstant: 200), // height
            logoImageView.widthAnchor.constraint(equalToConstant: 200) // width
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40), // Y
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), // width & X
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), // width & X
            usernameTextField.heightAnchor.constraint(equalToConstant: 50) // height
        ])
    }
    
    func configureGetFollowersButton() {
        view.addSubview(getFollowersButton)
        
        NSLayoutConstraint.activate([
            getFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40), // Y
            getFollowersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), // X & width
            getFollowersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), // X & width
            getFollowersButton.heightAnchor.constraint(equalToConstant: 50) // height
        ])
    }

}
