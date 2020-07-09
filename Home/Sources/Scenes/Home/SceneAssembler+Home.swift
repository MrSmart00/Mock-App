// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit
import Core
import Overture

extension SceneAssembler {

    static func home(context: Home.Context,
                       wireframeClosure: @escaping (Home.Wireframe) -> Void) -> (Environment) -> UIViewController {
        return { environment in
            let controller = Storyboard<HomeViewController>(name: "Home").instantiate()
// TODO: inject presenter to HomeViewController
//            let presenter = HomePresenter(context: context, wireframeClosure: wireframeClosure)
//            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
