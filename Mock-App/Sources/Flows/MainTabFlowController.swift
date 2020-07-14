//
//  MainTabFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/11.
//

import UIKit
import Core
import Common
import Domain

class MainTabFlowController: FlowController {

    private let environmentClosure: () -> Environment
    private let flowAssembler: () -> FlowAssemblerProtocol

    private weak var maintabView: MainTabView?

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(environmentClosure: @escaping () -> Environment, flowAssembler: @escaping () -> FlowAssemblerProtocol) {
        self.environmentClosure = environmentClosure
        self.flowAssembler = flowAssembler

        super.init(nibName: nil, bundle: nil)
    }

    public override func start() {
        maintabView = SceneAssembler.maintab(
            context: .init(),
            contents: [
                home(),
                sub()
            ],
            wireframeClosure: { _ in  }
        )(environmentClosure())
        maintabView.compact { [weak self] in self?.add(child: $0) }
    }

    private func home() -> MainTabContent {
        return .init(
            item: .home,
            controller: flowAssembler().home().apply { $0.start() }
        )
    }

    private func sub() -> MainTabContent {
        return .init(
            item: .sub,
            controller: flowAssembler()
                .subContent(mainTabClosure: { [weak self] in
                    self?.maintabView?.selecteTab($0)
                })
                .apply { $0.start() }
        )
    }

}
