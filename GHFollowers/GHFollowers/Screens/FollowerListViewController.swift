//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/15/21.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            
            if let errorMessage = errorMessage {
                print(errorMessage)
                self.presentCustomAlertOnMainThread(title: "An Error Occured", message: errorMessage.rawValue, buttonTitle: "Ah, well")
                return
            }
            
            guard let followers = followers else {
                self.presentCustomAlertOnMainThread(title: "No followers found.", message: errorMessage?.rawValue ?? "Default error message", buttonTitle: "Okay")
                return
            }
            
            print("Followers count: \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
}
