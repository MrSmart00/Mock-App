//
//  MainTabPresenter.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class MainTabPresenter: MainTabPresentation {
    private let context: MainTab.Context
    private let interactor: MainTabUsecase
    private let wireframeClosure: (MainTab.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: MainTab.Context, interactor: MainTabUsecase, wireframeClosure: @escaping (MainTab.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: MainTabMessage) {
        // TODO: Impl with combine
    }
}
