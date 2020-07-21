//
//  SplashInteractor.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine
import MockAPI

final class SplashInteractor: SplashUsecase {

    let tokenRepository: TokenRepositoryType

    init(tokenRepository: TokenRepositoryType) {
        self.tokenRepository = tokenRepository
    }

    func hasAccessToken() -> AnyPublisher<Bool, Never> {
        return Just(0)
            .map { [weak self] _ in
                !(self?.tokenRepository.token.isNil ?? true)
            }
            .eraseToAnyPublisher()
    }

}
