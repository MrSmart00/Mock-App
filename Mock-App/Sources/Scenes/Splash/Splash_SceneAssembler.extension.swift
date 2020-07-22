//
//  Splash_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func splash(context: Splash.Context, wireframeClosure: @escaping (Splash.Wireframe) -> Void) -> (Environment) -> SplashView {
        return { environment in
            let presenter = SplashPresenter(context: context,
                                            interactor: SplashInteractor(tokenRepository: environment.accessTokenRepository),
                                            wireframeClosure: wireframeClosure)
            return Storyboard<SplashViewController>(name: "Splash")
                .instantiate(with: .init(presenter: presenter))
        }
    }

}
