//
//  SubContent_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func subcontent(context: SubContent.Context, wireframeClosure: @escaping (SubContent.Wireframe) -> Void) -> (Environment) -> SubContentView {
        return { environment in
            let presenter = SubContentPresenter(context: context, interactor: SubContentInteractor(accessTokenRepository: environment.accessTokenRepository), wireframeClosure: wireframeClosure)
            return Storyboard<SubContentViewController>(name: "SubContent")
                .instantiate(with: .init(presenter: presenter))
        }
    }

}
