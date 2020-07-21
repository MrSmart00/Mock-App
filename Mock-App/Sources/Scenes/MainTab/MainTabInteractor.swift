//
//  MainTabInteractor.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import MockAPI

final class MainTabInteractor: MainTabUsecase {
    let networkService: NetworkServiceType
    let accessTokenRepository: TokenRepositoryType

    init(networkService: NetworkServiceType, accessTokenRepository: TokenRepositoryType) {
        self.networkService = networkService
        self.accessTokenRepository = accessTokenRepository
    }
}
