//
//  MainTabPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class MainTabPresenter: MainTabPresenterProtocol {
    private let context: MainTab.Context
    private let interactor: MainTabInteractorProtocol
    private let wireframeClosure: (MainTab.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: MainTab.Context, interactor: MainTabInteractorProtocol, wireframeClosure: @escaping (MainTab.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: MainTabMessage) {
        // TODO: Impl with combine
    }
}
