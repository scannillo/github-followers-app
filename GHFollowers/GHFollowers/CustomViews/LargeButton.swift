//
//  LargeButton.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/14/21.
//

import UIKit

class LargeButton: UIButton {

    // TODO: Do we need 2 inits for this class really? Can this one go?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: Are these initializers really that helpful?
    // What benefit do they bring to just setting these properties when needed from the call site?
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)    // This will get it's width, height, x and y coordinate on the screen when we set our constraints.
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configureStyling()
    }
    
    private func configureStyling() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
