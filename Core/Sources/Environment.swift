//
//  Environment.swift
//  Core
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import Foundation
import MockAPI

public struct Environment {
    public let networkService: NetworkServiceType
    public let accessTokenRepository: TokenRepositoryType

    public init(networkService: NetworkServiceType, accessTokenRepository: TokenRepositoryType) {
        self.networkService = networkService
        self.accessTokenRepository = accessTokenRepository
    }
}
