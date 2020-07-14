//
//  SubContentPresenter.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SubContentPresenter: SubContentPresentation {
    private let context: SubContent.Context
    private let interactor: SubContentUsecase
    private let wireframeClosure: (SubContent.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: SubContent.Context, interactor: SubContentUsecase, wireframeClosure: @escaping (SubContent.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: SubContentMessage) {
        if case .tappedDetail = message {
            wireframeClosure(.detail)
        }
    }
}
