// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import Combine

final class SplashPresenter: SplashPresenterProtocol {
    private let context: Splash.Context
    private let wireframeClosure: (Splash.Wireframe) -> Void

    private var cancellables = Set<AnyCancellable>()

    init(context: Splash.Context, wireframeClosure: @escaping (Splash.Wireframe) -> Void) {
        self.context = context
        self.wireframeClosure = wireframeClosure
    }

    func dispatch(_ message: SplashMessage) {
        if case .viewDidAppear = message {
            Timer.publish(every: 1, on: .main, in: .default)
                .autoconnect()
                .sink { [unowned self] (_) in
                    self.wireframeClosure(.home)
                }
                .store(in: &cancellables)
        }
    }
}
