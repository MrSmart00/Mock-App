//
//  AuthTopPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class AuthTopPresenter: AuthTopPresentation {
    var state: CurrentValueSubject<AuthTop.State, Never> = .init(.initial)

    private let context: AuthTop.Context
    private let interactor: AuthTopUsecase
    private let wireframeClosure: (AuthTop.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: AuthTop.Context, interactor: AuthTopUsecase, wireframeClosure: @escaping (AuthTop.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: AuthTop.Message) {
        switch message {
        case .tappedSignup:
            wireframeClosure(.signup)
        case .tappedLogin:
            wireframeClosure(.login)
        }
    }
}
