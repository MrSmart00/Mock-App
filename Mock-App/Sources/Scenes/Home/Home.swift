//
//  Home.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation

enum Home {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

protocol HomeInteractorProtocol {

}

public enum HomeMessage {

}

protocol HomePresenterProtocol {
    func dispatch(_ message: HomeMessage)
}
