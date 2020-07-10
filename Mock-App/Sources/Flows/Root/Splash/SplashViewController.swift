// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import UIKit
import Combine
import Common

final class SplashViewController: UIViewController, Injectable {
    struct Dependency {
        let presenter: SplashPresenterProtocol
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dependency.presenter.dispatch(.viewDidAppear)
    }

    func inject(dependency: SplashViewController.Dependency) {
        self.dependency = dependency
    }
}
