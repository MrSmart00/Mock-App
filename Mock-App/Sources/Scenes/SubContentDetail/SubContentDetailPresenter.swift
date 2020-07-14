//
//  SubContentDetailPresenter.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import Combine

final class SubContentDetailPresenter: SubContentDetailPresentation {
    private let context: SubContentDetail.Context
    private let interactor: SubContentDetailUsecase
    private let wireframeClosure: (SubContentDetail.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: SubContentDetail.Context, interactor: SubContentDetailUsecase, wireframeClosure: @escaping (SubContentDetail.Wireframe) -> Void) {
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
