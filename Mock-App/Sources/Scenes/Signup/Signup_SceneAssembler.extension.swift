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
            let presenter = SignupPresenter(context: context,
                                            interactor: SignupInteractor(
                                                networkService: environment.networkService,
                                                tokenRepository: environment.accessTokenRepository),
                                            wireframeClosure: wireframeClosure)
            return Storyboard<SignupViewController>(name: "Signup")
                .instantiate(with: .init(presenter: presenter))
        }
    }

}
