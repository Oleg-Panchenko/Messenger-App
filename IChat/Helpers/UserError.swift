//
//  UserError.swift
//  IChat
//
//  Created by Panchenko Oleg on 21.12.2022.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill all the fields.", comment: "")
        case .photoNotExist:
            return NSLocalizedString("User did not choose a photo.", comment: "")
        }
    }
}
