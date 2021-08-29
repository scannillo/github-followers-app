//
//  SecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/29/21.
//

import UIKit

class SecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configureStyling()
    }
    
    private func configureStyling() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90       // minimum possible font size as % of original
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
