//
//  SubContent.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

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
