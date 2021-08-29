//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/28/21.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        print(username)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }

}
