//
//  MChat.swift
//  IChat
//
//  Created by Panchenko Oleg on 13.12.2022.
//

import Foundation

struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
