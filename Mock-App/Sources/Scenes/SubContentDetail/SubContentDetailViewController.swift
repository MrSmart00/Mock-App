//
//  SubContentDetailViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common

final class SubContentDetailViewController: UIViewController, SubContentDetailView, Injectable {
    struct Dependency {
        let presenter: SubContentDetailPresentation
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var homeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        dependency.presenter.state
            .sink(receiveValue: { [weak self] in self?.bind(state: $0) })
            .store(in: &cancellables)

        homeButton
            .tapPublisher
            .sink { [weak self] in
                self?.dependency
                    .presenter
                    .dispatch(.tappedHome)
            }
            .store(in: &cancellables)
    }

    func inject(dependency: SubContentDetailViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: SubContentDetail.State) {
        // TODO: layout a view from state
    }

}
