//
//  SubContentDetail.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

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
