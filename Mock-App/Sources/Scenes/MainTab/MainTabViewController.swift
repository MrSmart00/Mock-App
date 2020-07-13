//
//  MainTabViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common
import Domain

final class MainTabViewController: UITabBarController, Injectable {
    struct Dependency {
        let presenter: MainTabPresenterProtocol
        let contents: [MainTabContent]
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        var controllers = [UIViewController]()
        dependency.contents.forEach {
            let controller = $0.controller
            controller.tabBarItem.title = $0.item.name
            controllers.append(controller)
        }
        setViewControllers(controllers, animated: false)
    }

    func inject(dependency: MainTabViewController.Dependency) {
        self.dependency = dependency
    }
}

extension MainTabViewController: MainTabSelectable {

    func selecteTab(_ item: MainTabItem) {
        let content = dependency.contents.first { (content) -> Bool in
            if content.item == item {
                return true
            }
            return false
        }
        selectedViewController = content?.controller
    }

}
