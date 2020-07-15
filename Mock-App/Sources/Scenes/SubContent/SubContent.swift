//
//  SubContent.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine

enum SubContent {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        case detail
    }

    public struct State {
        static var initial: State {
            .init()
        }
        // TODO: Add property for view layouts
    }

    public enum Message {
        case tappedDetail
    }
}

protocol SubContentUsecase {
    // TODO: Add function for data fetch from Server
}

protocol SubContentPresentation {
    var state: CurrentValueSubject<SubContent.State, Never> { get }

    func dispatch(_ message: SubContent.Message)
}

protocol SubContentView: UIViewController {

}
