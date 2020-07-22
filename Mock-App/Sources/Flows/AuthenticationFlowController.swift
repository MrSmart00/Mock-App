//
//  AuthenticationFlowController.swift
//  Mock-App
//
//  Created by 日野森寛也 on 2020/07/21.
//

import UIKit
import Core

class AuthenticationFlowController: NavigationFlowController {
    private let environmentClosure: () -> Environment

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(environmentClosure: @escaping () -> Environment) {
        self.environmentClosure = environmentClosure
        super.init(nibName: nil, bundle: nil)
    }

    public override func start() {
        let controller = SceneAssembler.authtop(
            context: .init(),
            wireframeClosure: { [weak self] in
                switch $0 {
                case .signup:
                    self?.signup()
                case .login:
                    break
                }
            }
        )(environmentClosure())
        navigation.viewControllers = [controller]
    }

    func signup() {
        let controller = SceneAssembler.signup(
            context: .init(),
            wireframeClosure: { [weak self] _ in
                self?.dismiss()
            }
        )(environmentClosure())
        navigation.pushViewController(controller, animated: true)
    }

    func dismiss() {
        navigation.dismiss(animated: true, completion: nil)
    }
}
