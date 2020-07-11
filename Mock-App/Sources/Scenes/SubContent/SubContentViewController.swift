// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
import UIKit
import Combine
import Common
import CombineCocoa

final class SubContentViewController: UIViewController, Injectable {
    struct Dependency {
        let presenter: SubContentPresenterProtocol
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var detailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        detailButton.tapPublisher
            .sink { [weak self] (_) in
                self?.dependency.presenter.dispatch(.tappedDetail)
            }
            .store(in: &cancellables)
    }

    func inject(dependency: SubContentViewController.Dependency) {
        self.dependency = dependency
    }
}
