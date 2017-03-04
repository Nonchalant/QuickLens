//
//  User.swift
//  QuickLens
//
//  Created by Takeshi Ihara on 2017/03/04.
//  Copyright © 2017年 Takeshi Ihara. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let age: Int
    let sns: SNS
    let type: CustomerType

    var isStudent: Bool {
        return age >= 6 && age <= 15
    }

    var hasSNSAccount: Bool {
        guard sns.twitter != nil || sns.github != nil else {
            return false
        }
        return true
    }
}
