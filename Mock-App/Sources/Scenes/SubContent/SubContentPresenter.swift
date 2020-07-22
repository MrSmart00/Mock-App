//
//  SubContentPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SubContentPresenter: SubContentPresentation {
    var state: CurrentValueSubject<SubContent.State, Never> = .init(.initial)

    private let context: SubContent.Context
    private let interactor: SubContentUsecase
    private let wireframeClosure: (SubContent.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: SubContent.Context, interactor: SubContentUsecase, wireframeClosure: @escaping (SubContent.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: SubContent.Message) {
        switch message {
        case .tappedDetail:
            wireframeClosure(.detail)
        case .tappedLogout:
            interactor.logout()
                .sink { [weak self] (_) in
                    self?.wireframeClosure(.splash)
                }
                .store(in: &cancellables)
        }
    }
}
