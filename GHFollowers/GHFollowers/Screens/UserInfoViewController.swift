//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/28/21.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    private var follower: Follower
    
    init(with follower: Follower) {
        self.follower = follower
        super.init(nibName: nil, bundle: nil)
    }
    
    // if this view controller is loaded from a storyboard, follower will be nil
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: follower.login) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }

}
