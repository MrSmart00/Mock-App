//
//  MainTab_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func MainTab(context: MainTab.Context, viewControllers: [UIViewController], wireframeClosure: @escaping (MainTab.Wireframe) -> Void) -> (Environment) -> UIViewController {
        return { environment in
            let controller = Storyboard<MainTabViewController>(name: "MainTab").instantiate()
            controller.setViewControllers(viewControllers, animated: false)
    // TODO: inject presenter to MainTabViewController
    //            let presenter = MainTabPresenter(context: context, wireframeClosure: wireframeClosure)
    //            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
