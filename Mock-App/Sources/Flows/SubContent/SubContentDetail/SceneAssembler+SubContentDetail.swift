// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit
import Core
import Common

extension SceneAssembler {

    static func subContentDetail(context: SubContentDetail.Context, wireframeClosure: @escaping (SubContentDetail.Wireframe) -> Void) -> (Environment) -> UIViewController {
        return { environment in
            let controller = Storyboard<SubContentDetailViewController>(name: "SubContentDetail").instantiate()
// TODO: inject presenter to SubContentDetailViewController
//            let presenter = SubContentDetailPresenter(context: context, wireframeClosure: wireframeClosure)
//            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
