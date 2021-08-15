//
//  LargeTextField.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/15/21.
//

import UIKit

class LargeTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyling() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .systemGreen
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder = "Enter a username"
        
        translatesAutoresizingMaskIntoConstraints = false
    }

}
