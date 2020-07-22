//
//  RootFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit
import Core
import Combine

class RootFlowController: FlowController {
    private let environmentClosure: () -> Environment
    private let flowAssembler: () -> FlowAssemblerProtocol
    private var cancellables = Set<AnyCancellable>()
    private var splash: SplashView?

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(environmentClosure: @escaping () -> Environment, flowAssembler: @escaping () -> FlowAssemblerProtocol) {
        self.environmentClosure = environmentClosure
        self.flowAssembler = flowAssembler

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.publisher(for: .loggedOut)
            .sink(receiveValue: { [weak self] _ in
                self?.start()
            })
            .store(in: &cancellables)
    }

    override func start() {
        let controller = SceneAssembler.splash(
            context: Splash.Context(),
            wireframeClosure: { [weak self] in
                switch $0 {
                case .auth:
                    self?.auth()
                case .mainTab:
                    self?.mainTab()
                }
            }
        )(environmentClosure())
        add(child: controller)
        splash = controller
    }

    func mainTab() {
        let controller = flowAssembler().mainTab()
        transit(to: controller)
        controller.start()
    }

    func auth() {
        let controller = flowAssembler().auth()
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
        controller.start()
    }

    private func transit(to destinationController: UIViewController) {
        if let current = root {
            remove(child: current)
        }
        add(child: destinationController)
    }

}
