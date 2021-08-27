//
//  AvatarImageView.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/17/21.
//

import UIKit

class AvatarImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = UIImage(named: "avatar-placeholder")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        // Check cache first
        if let image = NetworkManager.shared.cache.object(forKey: urlString as NSString) {
            self.image = image
            return
        }
        
        // If not in cache, download image
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data = data,
                  error == nil else {
                return
            }
            
            guard let image = UIImage(data: data) else { return }
            NetworkManager.shared.cache.setObject(image, forKey: urlString as NSString)
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
}
