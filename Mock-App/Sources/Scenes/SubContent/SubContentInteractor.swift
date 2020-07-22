//
//  SubContentInteractor.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine
import MockAPI

final class SubContentInteractor: SubContentUsecase {

    private var accessTokenRepository: TokenRepositoryType!

    init(accessTokenRepository: TokenRepositoryType) {
        self.accessTokenRepository = accessTokenRepository
    }

    func logout() -> AnyPublisher<Void, Never> {
        Just(())
            .handleEvents(receiveOutput: { [weak self] (_) in
                self?.accessTokenRepository.token = nil
            })
            .eraseToAnyPublisher()
    }

}
