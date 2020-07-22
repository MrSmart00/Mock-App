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
        case splash
    }

    public struct State {
        static var initial: State {
            .init(title: "さぶこんてんと", buttonTitle: "しょうさいへ")
        }
        let title: String
        let buttonTitle: String
    }

    public enum Message {
        case tappedDetail
        case tappedLogout
    }
}

protocol SubContentUsecase {
    func logout() -> AnyPublisher<Void, Never>
}

protocol SubContentPresentation {
    var state: CurrentValueSubject<SubContent.State, Never> { get }

    func dispatch(_ message: SubContent.Message)
}

protocol SubContentView: UIViewController {

}
