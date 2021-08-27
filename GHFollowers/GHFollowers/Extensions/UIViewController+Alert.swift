//
//  UIViewController+Alert.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/15/21.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentCustomAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async { // throw onto main thread
            let alertViewController = AlertViewController(alertTitle: title, bodyMessage: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.alpha = 0
        containerView.backgroundColor = .systemBackground
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        activityIndicator.startAnimating()
    }
    
    func hideLoadingView() {
        containerView.removeFromSuperview()
    }
    
}
