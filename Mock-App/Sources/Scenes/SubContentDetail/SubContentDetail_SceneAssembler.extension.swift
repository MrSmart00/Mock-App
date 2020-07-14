//
//  SubContentDetail_SceneAssembler.extension.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit
import Core
import Common

extension SceneAssembler {

    static func subcontentdetail(context: SubContentDetail.Context, wireframeClosure: @escaping (SubContentDetail.Wireframe) -> Void) -> (Environment) -> SubContentDetailView {
        return { environment in
            let controller = Storyboard<SubContentDetailViewController>(name: "SubContentDetail").instantiate()
            let presenter = SubContentDetailPresenter(context: context, interactor: SubContentDetailInteractor(), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
