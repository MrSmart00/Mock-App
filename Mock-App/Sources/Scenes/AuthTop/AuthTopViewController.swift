//
//  AuthTopViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 22/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common
import CombineCocoa

final class AuthTopViewController: UIViewController, AuthTopView, Injectable {
    struct Dependency {
        let presenter: AuthTopPresentation
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginBUtton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dependency.presenter.state
            .sink(receiveValue: { [weak self] in self?.bind(state: $0) })
            .store(in: &cancellables)

        signupButton.tapPublisher
            .sink { [weak self] (_) in
                self?.dependency.presenter.dispatch(.tappedSignup)
            }
            .store(in: &cancellables)

        loginBUtton.tapPublisher
            .sink { [weak self] (_) in
                self?.dependency.presenter.dispatch(.tappedLogin)
            }
            .store(in: &cancellables)
    }

    func inject(dependency: AuthTopViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: AuthTop.State) {
        // TODO: layout a view from state
    }

}
