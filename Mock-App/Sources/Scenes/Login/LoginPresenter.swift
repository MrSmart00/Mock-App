//
//  LoginPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class LoginPresenter: LoginPresentation {
    var state: CurrentValueSubject<Login.State, Never> = .init(.initial)

    private let context: Login.Context
    private let interactor: LoginUsecase
    private let wireframeClosure: (Login.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Login.Context, interactor: LoginUsecase, wireframeClosure: @escaping (Login.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: Login.Message) {
        if case let .tappedLogin(email, password) = message {
            interactor.login(email: email, password: password)
                .sink(
                    receiveCompletion: { [weak self] in
                        if case let .failure(error) = $0, case let .error(title, message) = error {
                            self?.wireframeClosure(.error(title: title, message: message))
                        }
                    },
                    receiveValue: { [weak self] _ in
                        self?.wireframeClosure(.mainTab)
                    }
                )
                .store(in: &cancellables)
        }
    }
}
