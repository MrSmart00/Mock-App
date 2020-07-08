//
//  SceneAssembler+Splash.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit
import Core
import Overture

extension SceneAssembler {

    static func splash(context: Splash.Context,
                       wireframeClosure: @escaping (Splash.Wireframe) -> Void) -> (Environment) -> UIViewController {
        return { environment in
            let controller = Storyboard<SplashViewController>(name: "Splash").instantiate()
            let presenter = SplashPresenter(context: context, wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
