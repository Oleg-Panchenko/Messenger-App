//
//  SelfConfiguringCell.swift
//  IChat
//
//  Created by Panchenko Oleg on 05.07.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
