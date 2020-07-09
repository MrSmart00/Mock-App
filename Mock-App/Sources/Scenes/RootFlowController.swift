//
//  RootFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit
import Core

class RootFlowController: FlowController {
    private let environmentClosure: () -> Environment
    private let flowAssembler: () -> FlowAssemblerProtocol

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(environmentClosure: @escaping () -> Environment, flowAssembler: @escaping () -> FlowAssemblerProtocol) {
        self.environmentClosure = environmentClosure
        self.flowAssembler = flowAssembler

        super.init(nibName: nil, bundle: nil)
    }

    override func start() {
        let controller = SceneAssembler.splash(
            context: Splash.Context(),
            wireframeClosure: { _ in
            }
        )(environmentClosure())
        add(child: controller)
    }
}
