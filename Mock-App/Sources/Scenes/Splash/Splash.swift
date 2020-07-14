//
//  Splash.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit

enum Splash {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {
        case mainTab
    }
}

protocol SplashUsecase {

}

public enum SplashMessage {
    case viewDidAppear
}

protocol SplashPresentation {
    func dispatch(_ message: SplashMessage)
}

protocol SplashView: UIViewController {

}
