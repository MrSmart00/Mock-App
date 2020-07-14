//
//  SplashPresenter.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SplashPresenter: SplashPresentation {
    private let context: Splash.Context
    private let interactor: SplashUsecase
    private let wireframeClosure: (Splash.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Splash.Context, interactor: SplashUsecase, wireframeClosure: @escaping (Splash.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: SplashMessage) {
        if case .viewDidAppear = message {
            Timer.publish(every: 1, on: .main, in: .default)
                .autoconnect()
                .sink { [unowned self] (_) in
                    self.wireframeClosure(.mainTab)
                }
                .store(in: &cancellables)
        }
    }
}
