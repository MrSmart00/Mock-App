//
//  SubContentDetailPresenter.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SubContentDetailPresenter: SubContentDetailPresenterProtocol {
    private let context: SubContentDetail.Context
    private let interactor: SubContentDetailInteractorProtocol
    private let wireframeClosure: (SubContentDetail.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: SubContentDetail.Context, interactor: SubContentDetailInteractorProtocol, wireframeClosure: @escaping (SubContentDetail.Wireframe) -> Void) {
        self.context = context
        self.interactor = interactor
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: SubContentDetailMessage) {
        switch message {
        case .tappedHome:
            wireframeClosure(.home)
        }
    }
}
