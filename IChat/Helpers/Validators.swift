//
//  Validators.swift
//  IChat
//
//  Created by Panchenko Oleg on 20.12.2022.
//

import Foundation
 
class Validators {
    
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let email = email,
              let password = password,
              let confirmPassword = confirmPassword,
              email != "",
              password != "",
              confirmPassword != "" else {
            return false
        }
        return true
    }
    
    static func isFilled(username: String?, description: String?, sex: String?) -> Bool {
        guard let username = username,
              let description = description,
              let sex = sex,
              username != "",
              description != "",
              sex != "" else {
            return false
        }
        return true
    }
    
    static func isSimpleEmail(email: String) -> Bool {
        let regEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: regEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
