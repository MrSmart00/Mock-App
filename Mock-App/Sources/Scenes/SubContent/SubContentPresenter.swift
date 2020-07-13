//
//  SubContentPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SubContentPresenter: SubContentPresenterProtocol {
    private let context: SubContent.Context
    private let interactor: SubContentInteractorProtocol
    private let wireframeClosure: (SubContent.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: SubContent.Context, interactor: SubContentInteractorProtocol, wireframeClosure: @escaping (SubContent.Wireframe) -> Void) {
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
