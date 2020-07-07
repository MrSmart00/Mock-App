// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

enum Dummy {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

protocol DummyInteractorProtocol {

}

public enum DummyMessage {

}

protocol DummyPresenterProtocol {
    func dispatch(_ message: DummyMessage)
}
