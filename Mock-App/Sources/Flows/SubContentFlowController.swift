//
//  SubContentFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/11.
//

import UIKit
import Core
import Domain

class SubContentFlowController: NavigationFlowController {

    private let environmentClosure: () -> Environment
    private let mainTabClosure: ((MainTabItem) -> Void)?

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(environmentClosure: @escaping () -> Environment, mainTabClosure: ((MainTabItem) -> Void)? = nil) {
        self.environmentClosure = environmentClosure
        self.mainTabClosure = mainTabClosure
        super.init(nibName: nil, bundle: nil)
    }

    public override func start() {
        let controller = SceneAssembler.subcontent(
            context: .init(),
            wireframeClosure: { [weak self] in
                switch $0 {
                case .detail:
                    self?.detail()
                case .splash:
                    self?.splash()
                }
            }
        )(environmentClosure())
        navigation.viewControllers = [controller]
    }

    private func detail() {
        let controller = SceneAssembler.subcontentdetail(
            context: .init(),
            wireframeClosure: { [weak self] in
                switch $0 {
                case .home:
                    self?.mainTabClosure?(.home)
                    self?.presentedViewController?.dismiss(animated: true, completion: nil)
                }
            }
        )(environmentClosure())
        present(controller, animated: true, completion: nil)
    }

    private func splash() {
        NotificationCenter.default.post(name: .loggedOut, object: nil)
    }
}
