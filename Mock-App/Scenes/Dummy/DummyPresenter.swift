// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import Combine

final class DummyPresenter: DummyPresenterProtocol {
    private let context: Dummy.Context
    private let wireframeClosure: (Dummy.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Dummy.Context, wireframeClosure: @escaping (Dummy.Wireframe) -> Void) {
        self.context = context
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: DummyMessage) {
        // TODO: Impl with combine
    }
}
