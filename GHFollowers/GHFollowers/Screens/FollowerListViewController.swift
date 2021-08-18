//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/15/21.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()             // Table of contents for your VC
        configureViewControllerUI()
        configureCollectionView()
        getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Layout UI
    
    func configureViewControllerUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemGreen
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier)
    }
    
    // MARK: - Helpers
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print("Followers count: \(followers.count)")
                print(followers)
            case .failure(let error):
                self.presentCustomAlertOnMainThread(title: "No followers found.", message: error.rawValue, buttonTitle: "Okay")
            }
        }
    }
    
}
