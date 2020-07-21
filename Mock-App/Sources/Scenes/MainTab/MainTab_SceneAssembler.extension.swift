//
//  MainTab_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common
import Domain

extension SceneAssembler {

    static func maintab(context: MainTab.Context, contents: [MainTabContent], wireframeClosure: @escaping (MainTab.Wireframe) -> Void) -> (Environment) -> MainTabView {
        return { environment in
            let controller = Storyboard<MainTabViewController>(name: "MainTab").instantiate()
            let presenter = MainTabPresenter(context: context,
                                             interactor: MainTabInteractor(
                                                networkService: environment.networkService,
                                                accessTokenRepository: environment.accessTokenRepository),
                                             wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter, contents: contents))
            return controller
        }
    }

}
