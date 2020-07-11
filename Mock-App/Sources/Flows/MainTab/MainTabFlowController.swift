//
//  MainTabFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/11.
//

import UIKit
import Core
import Common

class MainTabFlowController: NavigationFlowController {

    private let environmentClosure: () -> Environment

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(environmentClosure: @escaping () -> Environment) {
        self.environmentClosure = environmentClosure

        super.init(nibName: nil, bundle: nil)
    }

    public override func start() {
        let controller = SceneAssembler.mainTab(
            context: .init(),
            viewControllers: [
                home(),
                sub()
            ],
            wireframeClosure: { _ in  }
        )(environmentClosure())
        navigation.viewControllers = [controller]
    }

    private func home() -> UIViewController {
        SceneAssembler.home(
            context: .init(),
            wireframeClosure: { _ in  }
        )(environmentClosure())
        .apply {
            $0.tabBarItem.title = "ほーむ"
        }
    }

    private func sub() -> UIViewController {
        SceneAssembler.subContent(
            context: .init(),
            wireframeClosure: { _ in  }
        )(environmentClosure())
        .apply {
            $0.tabBarItem.title = "さぶ"
        }
    }
}
