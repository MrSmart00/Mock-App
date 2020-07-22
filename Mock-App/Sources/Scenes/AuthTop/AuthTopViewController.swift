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

    private let dependency: Dependency

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginBUtton: UIButton!

    init?(coder: NSCoder, dependency: Dependency) {
        self.dependency = dependency
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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

    private func bind(state: AuthTop.State) {
        // TODO: layout a view from state
    }

}
