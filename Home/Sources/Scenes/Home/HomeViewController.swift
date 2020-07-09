// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import UIKit
import Combine
import Common

final class HomeViewController: UIViewController, Injectable {
    struct Dependency {
        let presenter: HomePresenterProtocol
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func inject(dependency: HomeViewController.Dependency) {
        self.dependency = dependency
    }
}
