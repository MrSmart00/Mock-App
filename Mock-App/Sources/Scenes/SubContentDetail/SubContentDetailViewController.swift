// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import UIKit
import Combine
import Common
import CombineCocoa

final class SubContentDetailViewController: UIViewController, Injectable {
    struct Dependency {
        let presenter: SubContentDetailPresenterProtocol
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var homeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        homeButton
            .tapPublisher
            .sink { [weak self] in
                self?.dependency.presenter.dispatch(.tappedHome)
            }
            .store(in: &cancellables)
    }

    func inject(dependency: SubContentDetailViewController.Dependency) {
        self.dependency = dependency
    }
}
