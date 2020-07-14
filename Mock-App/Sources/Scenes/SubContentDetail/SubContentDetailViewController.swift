//
//  SubContentDetailViewController.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common
import CombineCocoa

final class SubContentDetailViewController: UIViewController, SubContentDetailView, Injectable {
    struct Dependency {
        let presenter: SubContentDetailPresentation
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
