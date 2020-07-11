// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import Combine

final class MainTabPresenter: MainTabPresenterProtocol {
    private let context: MainTab.Context
    private let wireframeClosure: (MainTab.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: MainTab.Context, wireframeClosure: @escaping (MainTab.Wireframe) -> Void) {
        self.context = context
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: MainTabMessage) {
        // TODO: Impl with combine
    }
}
