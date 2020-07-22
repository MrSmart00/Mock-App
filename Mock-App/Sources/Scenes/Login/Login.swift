//
//  Login.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine
import MockAPI

enum Login {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        case mainTab
    }

    public struct State {
        static var initial: State {
            .init()
        }
        // TODO: Add property for view layouts
    }

    public enum Message {
        case tappedLogin(email: String, password: String)
    }
}

protocol LoginUsecase {
    func login(email: String, password: String) -> AnyPublisher<Void, APIError>
}

protocol LoginPresentation {
    var state: CurrentValueSubject<Login.State, Never> { get }

    func dispatch(_ message: Login.Message)
}

protocol LoginView: UIViewController {

}
