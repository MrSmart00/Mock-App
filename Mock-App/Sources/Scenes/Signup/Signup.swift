//
//  Signup.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 21/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine

enum Signup {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        // TODO: Add trigger for view transition
    }

    public struct State {
        static var initial: State {
            .init()
        }
        // TODO: Add property for view layouts
    }

    public enum Message {
        // TODO: Add view events for dispatch via presenter
    }
}

protocol SignupUsecase {
    // TODO: Add function for data fetch from Server
}

protocol SignupPresentation {
    var state: CurrentValueSubject<Signup.State, Never> { get }

    func dispatch(_ message: Signup.Message)
}

protocol SignupView: UIViewController {

}