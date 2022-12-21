//
//  AuthError.swift
//  IChat
//
//  Created by Panchenko Oleg on 20.12.2022.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordsNotMatches
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill all the fields.", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Email format is not valid.", comment: "")
        case .passwordsNotMatches:
            return NSLocalizedString("Passwords are not identical.", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error.", comment: "")
        case .serverError:
            return NSLocalizedString("Server error.", comment: "")
        }
    }
}
