//
//  AuthTop_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func authtop(context: AuthTop.Context, wireframeClosure: @escaping (AuthTop.Wireframe) -> Void) -> (Environment) -> AuthTopView {
        return { environment in
            let presenter = AuthTopPresenter(context: context, interactor: AuthTopInteractor(), wireframeClosure: wireframeClosure)
            return Storyboard<AuthTopViewController>(name: "AuthTop")
                .instantiate(with: .init(presenter: presenter))
        }
    }

}
