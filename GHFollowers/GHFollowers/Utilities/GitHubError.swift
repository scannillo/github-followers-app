//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Samantha Cannillo on 8/16/21.
//

import Foundation

enum GitHubError: String, Error {
    case invalidUsername = "This username constructed an invalid URL."
    case connectionError = "Unable to connect to GitHub API."
    case serverError = "Server returned an error status code."
    case invalidData = "Data recieved from the server is invalid format."
}
