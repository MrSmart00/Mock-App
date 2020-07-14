//
//  MainTab.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Domain

enum MainTab {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

protocol MainTabUsecase {

}

public enum MainTabMessage {

}

protocol MainTabPresentation {
    func dispatch(_ message: MainTabMessage)
}

protocol MainTabView: UIViewController {
    func selecteTab(_ item: MainTabItem)
}
