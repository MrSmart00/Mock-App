// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

enum MainTab {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

protocol MainTabInteractorProtocol {

}

public enum MainTabMessage {

}

protocol MainTabPresenterProtocol {
    func dispatch(_ message: MainTabMessage)
}
