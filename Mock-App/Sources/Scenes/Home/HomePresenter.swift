//
//  HomePresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class HomePresenter: HomePresentation {
    var state: CurrentValueSubject<Home.State, Never> = .init(.initial)

    private let context: Home.Context
    private let interactor: HomeUsecase
    private let wireframeClosure: (Home.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Home.Context, interactor: HomeUsecase, wireframeClosure: @escaping (Home.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: Home.Message) {
        // TODO: Impl with combine
    }
}
