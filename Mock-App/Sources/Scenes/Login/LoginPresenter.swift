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
                receiveCompletion: {
                    switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("finished")
                    }
                },
                receiveValue: { [weak self] result in
                    print(result)
                    self?.wireframeClosure(.mainTab)
                }
            )
            .store(in: &cancellables)
        }
    }
}
