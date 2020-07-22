//
//  Signup.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 21/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine
import Core

enum Signup {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        case mainTab
        case error(title: String?, message: String?)
    }

    public struct State {
        static var initial: State {
            .init()
        }
        // TODO: Add property for view layouts
    }

    public enum Message {
        case tappedSignup(email: String, password: String)
    }
}

protocol SignupUsecase {
    func signup(email: String, password: String) -> AnyPublisher<Void, SceneError>
}

protocol SignupPresentation {
    var state: CurrentValueSubject<Signup.State, Never> { get }

    func dispatch(_ message: Signup.Message)
}

protocol SignupView: UIViewController {

}
