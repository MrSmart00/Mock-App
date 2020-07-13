//
//  SplashViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

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
