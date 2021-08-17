//
//  Follower.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/16/21.
//

import Foundation

struct Follower: Codable {
    var login: String           // If you don't make this optional, and the value isn't there
                                // app will crash
    var avatarUrl: String
}
