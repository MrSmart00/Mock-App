//
//  Home.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine

enum Home {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        // TODO: Add trigger for view transition
    }

    public struct State {
        static var initial: State {
            .init(title: "ほーむ")
        }

        let title: String
    }

    public enum Message {
        // TODO: Add view events for dispatch via presenter
    }
}

protocol HomeUsecase {
    // TODO: Add function for data fetch from Server
}

protocol HomePresentation {
    var state: CurrentValueSubject<Home.State, Never> { get }

    func dispatch(_ message: Home.Message)
}

protocol HomeView: UIViewController {

}
