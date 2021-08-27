//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/25/21.
//

import UIKit

struct UIHelper {
    
    // This could be an extension too instead
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        // Determime width of each cell
        let width = view.bounds.width
        let padding: CGFloat = 12
        let itemSpacing: CGFloat = 10
        let availableWidth = width - (2 * padding) - (2 * itemSpacing)
        let cellWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth + 40)
        
        return flowLayout
    }
    
}
