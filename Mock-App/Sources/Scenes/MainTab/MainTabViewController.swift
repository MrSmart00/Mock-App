//
//  MainTabViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common
import Domain

final class MainTabViewController: UITabBarController, MainTabView, Injectable {
    struct Dependency {
        let presenter: MainTabPresentation
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

        dependency.presenter.state
            .sink(receiveValue: bind(state:))
            .store(in: &cancellables)
    }

    func inject(dependency: MainTabViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: MainTab.State) {
        // TODO: layout a view from state
    }

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
