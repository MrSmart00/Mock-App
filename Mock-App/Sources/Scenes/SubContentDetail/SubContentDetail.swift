// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

enum SubContentDetail {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {
        case home
    }
}

protocol SubContentDetailInteractorProtocol {

}

public enum SubContentDetailMessage {
    case tappedHome
}

protocol SubContentDetailPresenterProtocol {
    func dispatch(_ message: SubContentDetailMessage)
}
