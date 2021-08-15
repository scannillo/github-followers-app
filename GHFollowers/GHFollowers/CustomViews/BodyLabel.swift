//
//  BodyLabel.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/15/21.
//

import UIKit

class BodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configureStyling()
    }
    
    private func configureStyling() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75       // minimum possible font size as % of original
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
