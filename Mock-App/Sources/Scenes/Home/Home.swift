//
//  Home.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit

enum Home {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

protocol HomeUsecase {

}

public enum HomeMessage {

}

protocol HomePresentation {
    func dispatch(_ message: HomeMessage)
}

protocol HomeView: UIViewController {

}
