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
        // TODO: Impl with combine
    }
}
