//
//  SubContentFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/11.
//

import UIKit
import Core

class SubContentFlowController: NavigationFlowController {

    private let environmentClosure: () -> Environment

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(environmentClosure: @escaping () -> Environment) {
        self.environmentClosure = environmentClosure

        super.init(nibName: nil, bundle: nil)
    }

    public override func start() {
        let controller = SceneAssembler.subContent(
            context: .init(),
            wireframeClosure: { [weak self] in
                switch $0 {
                case .detail:
                    self?.detail()
                }
            }
        )(environmentClosure())
        navigation.viewControllers = [controller]
    }

    private func detail() {
        let controller = SceneAssembler.subContentDetail(
            context: .init(),
            wireframeClosure: { [weak self] in
                switch $0 {
                case .home:
                    self?.home()
                }
            }
        )(environmentClosure())
        present(controller, animated: true, completion: nil)
    }

    private func home() {

    }
}
