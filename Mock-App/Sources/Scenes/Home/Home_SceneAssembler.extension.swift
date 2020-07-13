//
//  Home_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func Home(context: Home.Context, wireframeClosure: @escaping (Home.Wireframe) -> Void) -> (Environment) -> UIViewController { // swiftlint:disable:this identifier_name line_length
        return { environment in
            let controller = Storyboard<HomeViewController>(name: "Home").instantiate()
// TODO: inject presenter to HomeViewController
//            let presenter = HomePresenter(context: context, interactor: HomeInteractor(), wireframeClosure: wireframeClosure)
//            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
