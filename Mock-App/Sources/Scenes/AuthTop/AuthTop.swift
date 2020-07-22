//
//  AuthTop.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine

enum AuthTop {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        case signup
        case login
    }

    public struct State {
        static var initial: State {
            .init()
        }
        // TODO: Add property for view layouts
    }

    public enum Message {
        case tappedSignup
        case tappedLogin
    }
}

protocol AuthTopUsecase {
    // TODO: Add function for data fetch from Server
}

protocol AuthTopPresentation {
    var state: CurrentValueSubject<AuthTop.State, Never> { get }

    func dispatch(_ message: AuthTop.Message)
}

protocol AuthTopView: UIViewController {

}
