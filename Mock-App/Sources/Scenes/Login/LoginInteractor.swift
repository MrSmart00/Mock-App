//
//  LoginInteractor.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine
import Core
import MockAPI

final class LoginInteractor: LoginUsecase {

    let networkService: NetworkServiceType
    var tokenRepository: TokenRepositoryType

    init(networkService: NetworkServiceType, tokenRepository: TokenRepositoryType) {
        self.networkService = networkService
        self.tokenRepository = tokenRepository
    }

    func login(email: String, password: String) -> AnyPublisher<Void, SceneError> {
        let credential = Credential(email: email, password: password)
        return networkService.request(Endpoint.Authorization.PostLogin(body: credential))
            .mapError(SceneError.convert)
            .handleEvents(receiveOutput: { [weak self] in
                self?.tokenRepository.token = Token(rawValue: $0.token)
            })
            .map { _ in }
            .eraseToAnyPublisher()
    }

}
