//
//  HomePresenter.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class HomePresenter: HomePresentation {
    private let context: Home.Context
    private let interactor: HomeUsecase
    private let wireframeClosure: (Home.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Home.Context, interactor: HomeUsecase, wireframeClosure: @escaping (Home.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: HomeMessage) {
        // TODO: Impl with combine
    }
}
