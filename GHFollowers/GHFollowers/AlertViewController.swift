//
//  AlertViewController.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/15/21.
//

import UIKit

class AlertViewController: UIViewController {
    
    let containerView = UIView()
    let titleLabel = TitleLabel(textAlignment: .center, fontSize: 20)
    let bodyLabel = BodyLabel(textAlignment: .center)
    let okayButton = LargeButton(backgroundColor: .systemPink, title: "Okay.")
    
    var alertTitleText: String?
    var bodyMessageText: String?
    var buttonTitleText: String?
    
    let padding: CGFloat = 20

    init(alertTitle: String, bodyMessage: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitleText = alertTitle
        self.bodyMessageText = bodyMessage
        self.buttonTitleText = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.55)
        
        configureContainerView()
        configureTitleLabelStyling()
        configureButtonStyling()
        configureBodyLabel()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        // TODO: You could refactor this out into a custom Container View class
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // NOTE: smallet width is 320 on iPhone SE
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 250),
            containerView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configureTitleLabelStyling() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitleText ?? "Unknown"

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureButtonStyling() {
        containerView.addSubview(okayButton)
        okayButton.setTitle(buttonTitleText ?? "Ok", for: .normal)
        okayButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)

        NSLayoutConstraint.activate([
            okayButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            okayButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            okayButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            okayButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureBodyLabel() {
        containerView.addSubview(bodyLabel)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.text = bodyMessageText ?? "Unknown"
        bodyLabel.numberOfLines = 4

        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            bodyLabel.bottomAnchor.constraint(equalTo: okayButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissAlert() {
        dismiss(animated: true)
    }
}
