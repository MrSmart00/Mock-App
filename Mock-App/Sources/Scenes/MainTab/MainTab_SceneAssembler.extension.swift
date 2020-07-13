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
import Domain

extension SceneAssembler {

    static func MainTab(context: MainTab.Context, contents: [MainTabContent], wireframeClosure: @escaping (MainTab.Wireframe) -> Void) -> (Environment) -> UIViewController&MainTabSelectable { // swiftlint:disable:this identifier_name line_length
        return { environment in
            let controller = Storyboard<MainTabViewController>(name: "MainTab").instantiate()
            let presenter = MainTabPresenter(context: context,
                                             interactor: MainTabInteractor(),
                                             wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter, contents: contents))
            return controller
        }
    }

}
