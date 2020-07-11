//
//  MainTabFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/11.
//

import UIKit
import Core
import Common

class MainTabFlowController: FlowController {

    private let environmentClosure: () -> Environment
    private let flowAssembler: () -> FlowAssemblerProtocol

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(environmentClosure: @escaping () -> Environment, flowAssembler: @escaping () -> FlowAssemblerProtocol) {
        self.environmentClosure = environmentClosure
        self.flowAssembler = flowAssembler

        super.init(nibName: nil, bundle: nil)
    }

    public override func start() {
        let controller = SceneAssembler.mainTab(
            context: .init(),
            viewControllers: [
                home(),
                sub()
            ],
            wireframeClosure: { _ in  }
        )(environmentClosure())
        add(child: controller)
    }

    private func home() -> UIViewController {
        flowAssembler().home()
            .apply {
                $0.tabBarItem.title = "ほーむ"
                $0.start()
            }
    }

    private func sub() -> UIViewController {
        flowAssembler().subContent()
            .apply {
                $0.tabBarItem.title = "さぶ"
                $0.start()
            }
    }
}
