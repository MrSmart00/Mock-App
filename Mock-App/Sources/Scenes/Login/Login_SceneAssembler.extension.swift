//
//  Login_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func login(context: Login.Context, wireframeClosure: @escaping (Login.Wireframe) -> Void) -> (Environment) -> LoginView {
        return { environment in
            let controller = Storyboard<LoginViewController>(name: "Login").instantiate()
            let presenter = LoginPresenter(context: context, interactor: LoginInteractor(networkService: environment.networkService, tokenRepository: environment.accessTokenRepository), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
