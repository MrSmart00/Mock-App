//
//  Home.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Combine

enum Home {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

struct HomeState {
    static var initial: HomeState {
        .init(title: "ほーむ")
    }

    let title: String
}

protocol HomeUsecase {

}

public enum HomeMessage {

}

protocol HomePresentation {
    var state: CurrentValueSubject<HomeState, Never> { get }

    func dispatch(_ message: HomeMessage)
}

protocol HomeView: UIViewController {

}
