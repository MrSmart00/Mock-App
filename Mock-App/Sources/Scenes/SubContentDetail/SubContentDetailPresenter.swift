// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


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
