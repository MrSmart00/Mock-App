//
//  SubContentDetail.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine

enum SubContentDetail {
    public struct Context {
        public init() {}
        // TODO: Add properties for Presenter initialization
    }

    public enum Wireframe {
        case home
    }

    public struct State {
        static var initial: State {
            .init()
        }
        // TODO: Add property for view layouts
    }

    public enum Message {
        case tappedHome
    }
}

protocol SubContentDetailUsecase {
    // TODO: Add function for data fetch from Server
}

protocol SubContentDetailPresentation {
    var state: CurrentValueSubject<SubContentDetail.State, Never> { get }

    func dispatch(_ message: SubContentDetail.Message)
}

protocol SubContentDetailView: UIViewController {

}
