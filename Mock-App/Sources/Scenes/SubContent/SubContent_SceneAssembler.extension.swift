//
//  SubContent_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func SubContent(context: SubContent.Context, wireframeClosure: @escaping (SubContent.Wireframe) -> Void) -> (Environment) -> UIViewController {
        return { environment in
            let controller = Storyboard<SubContentViewController>(name: "SubContent").instantiate()
            let presenter = SubContentPresenter(context: context, interactor: SubContentInteractor(), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
