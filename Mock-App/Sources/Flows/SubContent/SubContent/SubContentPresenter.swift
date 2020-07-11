// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


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
