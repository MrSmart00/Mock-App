// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation

enum SubContent {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {
        case detail
    }
}

protocol SubContentInteractorProtocol {

}

public enum SubContentMessage {
    case tappedDetail
}

protocol SubContentPresenterProtocol {
    func dispatch(_ message: SubContentMessage)
}
