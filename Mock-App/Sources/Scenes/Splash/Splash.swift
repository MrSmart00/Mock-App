//
//  Splash.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine
import Domain

enum Splash {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        case auth
        case mainTab
    }

    public struct State {
        static var initial: State {
            .init()
        }
        // TODO: Add property for view layouts
    }

    public enum Message {
        case viewDidAppear
    }
}

protocol SplashUsecase {
    func hasAccessToken() -> AnyPublisher<Bool, Never>
}

protocol SplashPresentation {
    var state: CurrentValueSubject<Splash.State, Never> { get }

    func dispatch(_ message: Splash.Message)
}

protocol SplashView: UIViewController {
    func reload()
}
