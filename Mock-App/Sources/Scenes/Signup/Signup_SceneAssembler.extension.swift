//
//  Signup_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 21/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func signup(context: Signup.Context, wireframeClosure: @escaping (Signup.Wireframe) -> Void) -> (Environment) -> SignupView {
        return { environment in
            let controller = Storyboard<SignupViewController>(name: "Signup").instantiate()
            let presenter = SignupPresenter(context: context, interactor: SignupInteractor(), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
