//
//  MUser.swift
//  IChat
//
//  Created by Panchenko Oleg on 13.12.2022.
//

import UIKit

struct MUser: Hashable, Decodable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowerCasedFilter = filter.lowercased()
        return username.lowercased().contains(lowerCasedFilter)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
}
