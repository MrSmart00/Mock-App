// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit
import Core
import Common

extension SceneAssembler {

    static func subContent(context: SubContent.Context, wireframeClosure: @escaping (SubContent.Wireframe) -> Void) -> (Environment) -> UIViewController {
        return { environment in
            let controller = Storyboard<SubContentViewController>(name: "SubContent").instantiate()
            let presenter = SubContentPresenter(context: context, interactor: SubContentInteractor(), wireframeClosure: wireframeClosure)
            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
