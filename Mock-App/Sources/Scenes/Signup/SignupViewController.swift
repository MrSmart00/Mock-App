//
//  SignupViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 21/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common
import CombineCocoa

final class SignupViewController: UIViewController, SignupView, Injectable {
    struct Dependency {
        let presenter: SignupPresentation
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        dependency.presenter.state
            .sink(receiveValue: { [weak self] in self?.bind(state: $0) })
            .store(in: &cancellables)

        signupButton.tapPublisher
            .sink { [weak self] (_) in
                guard let email = self?.emailField.text,
                    let password = self?.passwordField.text else {
                    return
                }
                self?.dependency.presenter.dispatch(.tappedSignup(email: email, password: password))
            }
            .store(in: &cancellables)
    }

    func inject(dependency: SignupViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: Signup.State) {
        // TODO: layout a view from state
    }

}
