//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/28/21.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    
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
                DispatchQueue.main.async {
                    self.add(childViewController: UserInfoHeaderViewController(user: user), to: self.headerView)
                }
                print(user)
            case .failure(let error):
                print(error)
            }
        }
        
        layoutUI()
    }
    
    func layoutUI() {
        view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    // TODO: When do we want to add child VCs or sub UIViews?
    func add(childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }

}
