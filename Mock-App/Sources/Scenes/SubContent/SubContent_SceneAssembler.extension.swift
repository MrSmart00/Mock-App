//
//  SubContent_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func subcontent(context: SubContent.Context, wireframeClosure: @escaping (SubContent.Wireframe) -> Void) -> (Environment) -> SubContentView {
        return { environment in
            let controller = Storyboard<SubContentViewController>(name: "SubContent").instantiate()
            let presenter = SubContentPresenter(context: context, interactor: SubContentInteractor(), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
