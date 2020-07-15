//
//  Home_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func home(context: Home.Context, wireframeClosure: @escaping (Home.Wireframe) -> Void) -> (Environment) -> HomeView {
        return { environment in
            let controller = Storyboard<HomeViewController>(name: "Home").instantiate()
            let presenter = HomePresenter(context: context, interactor: HomeInteractor(), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
