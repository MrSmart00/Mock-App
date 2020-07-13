//
//  Splash_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func Splash(context: Splash.Context, wireframeClosure: @escaping (Splash.Wireframe) -> Void) -> (Environment) -> UIViewController { // swiftlint:disable:this identifier_name line_length
        return { environment in
            let controller = Storyboard<SplashViewController>(name: "Splash").instantiate()
            let presenter = SplashPresenter(context: context, interactor: SplashInteractor(), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
