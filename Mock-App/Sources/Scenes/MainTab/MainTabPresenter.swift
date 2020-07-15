//
//  MainTabPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class MainTabPresenter: MainTabPresentation {
    var state: CurrentValueSubject<MainTab.State, Never> = .init(.initial)

    private let context: MainTab.Context
    private let interactor: MainTabUsecase
    private let wireframeClosure: (MainTab.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: MainTab.Context, interactor: MainTabUsecase, wireframeClosure: @escaping (MainTab.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: MainTab.Message) {
        // TODO: Impl with combine
    }
}
