//
//  AccessTokenRepository.swift
//  Mock-App
//
//  Created by 日野森寛也 on 2020/07/21.
//

import Foundation
import MockAPI

struct AccessTokenRepository: TokenRepositoryType {
    let userDefaults: UserDefaults

    var token: Token? {
        get {
            let rawValue = userDefaults.value(forKey: "\(type(of: self)).token") as? String
            return rawValue.flatMap(Token.init(rawValue:))
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "\(type(of: self)).token")
        }
    }

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
}
