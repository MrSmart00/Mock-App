//
//  Splash.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation

enum Splash {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {
        case mainTab
    }
}

protocol SplashInteractorProtocol {

}

public enum SplashMessage {
    case viewDidAppear
}

protocol SplashPresenterProtocol {
    func dispatch(_ message: SplashMessage)
}
