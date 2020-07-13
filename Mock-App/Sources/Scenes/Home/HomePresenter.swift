//
//  HomePresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class HomePresenter: HomePresenterProtocol {
    private let context: Home.Context
    private let interactor: HomeInteractorProtocol
    private let wireframeClosure: (Home.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Home.Context, interactor: HomeInteractorProtocol, wireframeClosure: @escaping (Home.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: HomeMessage) {
        // TODO: Impl with combine
    }
}
