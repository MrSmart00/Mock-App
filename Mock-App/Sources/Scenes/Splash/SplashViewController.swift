//
//  SplashViewController.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
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
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dependency.presenter.dispatch(.viewDidAppear)
    }

    func inject(dependency: SplashViewController.Dependency) {
        self.dependency = dependency
    }
}
