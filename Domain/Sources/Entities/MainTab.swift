//
//  MainTab.swift
//  Domain
//
//  Created by hinomori-hiroya on 2020/07/13.
//

import UIKit

public enum MainTabItem {
    case home
    case sub

    public var name: String {
        switch self {
        case .home:
            return "ほーむ"
        case .sub:
            return "さぶ"
        }
    }
}

public struct MainTabContent {
    public let item: MainTabItem
    public let controller: UIViewController

    public init(item: MainTabItem, controller: UIViewController) {
        self.item = item
        self.controller = controller
    }
}
