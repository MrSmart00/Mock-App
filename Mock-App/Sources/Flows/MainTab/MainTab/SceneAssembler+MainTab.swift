// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import UIKit
import Core
import Common

extension SceneAssembler {

    static func mainTab(context: MainTab.Context,
                        viewControllers: [UIViewController],
                        wireframeClosure: @escaping (MainTab.Wireframe) -> Void) -> (Environment) -> UIViewController {
        return { environment in
            let controller = Storyboard<MainTabViewController>(name: "MainTab").instantiate()
            controller.setViewControllers(viewControllers, animated: false)
// TODO: inject presenter to MainTabViewController
//            let presenter = MainTabPresenter(context: context, wireframeClosure: wireframeClosure)
//            controller.inject(dependency: .init(presenter: presenter))
            return controller
        }
    }

}
