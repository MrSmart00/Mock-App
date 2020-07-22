//
//  SplashViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common

final class SplashViewController: UIViewController, SplashView, Injectable {
    struct Dependency {
        let presenter: SplashPresentation
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        dependency.presenter.state
            .sink(receiveValue: { [weak self] in self?.bind(state: $0) })
            .store(in: &cancellables)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dependency.presenter.dispatch(.viewDidAppear)
    }

    func inject(dependency: SplashViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: Splash.State) {
        // TODO: layout a view from state
    }
}
