//
//  MainTab.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation

enum MainTab {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {

    }
}

protocol MainTabInteractorProtocol {

}

public enum MainTabMessage {

}

protocol MainTabPresenterProtocol {
    func dispatch(_ message: MainTabMessage)
}
