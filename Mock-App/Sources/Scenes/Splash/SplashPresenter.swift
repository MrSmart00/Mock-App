//
//  SplashPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SplashPresenter: SplashPresentation {
    var state: CurrentValueSubject<Splash.State, Never> = .init(.initial)

    private let context: Splash.Context
    private let interactor: SplashUsecase
    private let wireframeClosure: (Splash.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Splash.Context, interactor: SplashUsecase, wireframeClosure: @escaping (Splash.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: Splash.Message) {
        if case .viewDidAppear = message {
            self.interactor
                .hasAccessToken()
                .delay(for: .seconds(1), scheduler: RunLoop.main)
                .sink { [weak self] (hasToken) in
                    self?.wireframeClosure(hasToken ? .mainTab : .auth)
                }
                .store(in: &cancellables)
        }
    }
}
