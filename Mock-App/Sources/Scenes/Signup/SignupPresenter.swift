//
//  SignupPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 21/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SignupPresenter: SignupPresentation {
    var state: CurrentValueSubject<Signup.State, Never> = .init(.initial)

    private let context: Signup.Context
    private let interactor: SignupUsecase
    private let wireframeClosure: (Signup.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Signup.Context, interactor: SignupUsecase, wireframeClosure: @escaping (Signup.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: Signup.Message) {
        switch message {
        case let .tappedSignup(email, password):
            interactor.signup(email: email, password: password)
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
