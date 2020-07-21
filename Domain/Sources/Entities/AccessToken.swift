//
//  AccessToken.swift
//  Domain
//
//  Created by 日野森寛也 on 2020/07/21.
//

import Foundation

public struct AccessToken: Equatable {
    /** アクセストークン */
    public let token: String

    public init(token: String) {
        self.token = token
    }
}
