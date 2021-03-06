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

    private let dependency: Dependency

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signupButton: UIButton!

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
                guard let email = self?.emailField.text,
                    let password = self?.passwordField.text else {
                    return
                }
                self?.dependency.presenter.dispatch(.tappedSignup(email: email, password: password))
            }
            .store(in: &cancellables)
    }

    private func bind(state: Signup.State) {
        // TODO: layout a view from state
    }

}
