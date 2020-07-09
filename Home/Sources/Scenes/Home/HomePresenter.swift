// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import Combine

final class HomePresenter: HomePresenterProtocol {
    private let context: Home.Context
    private let wireframeClosure: (Home.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Home.Context, wireframeClosure: @escaping (Home.Wireframe) -> Void) {
        self.context = context
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: HomeMessage) {
        // TODO: Impl with combine
    }
}
