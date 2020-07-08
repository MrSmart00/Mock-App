// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

enum Splash {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

protocol SplashInteractorProtocol {

}

public enum SplashMessage {

}

protocol SplashPresenterProtocol {
    func dispatch(_ message: SplashMessage)
}
