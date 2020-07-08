//
//  RootFlowController.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit
import Combine
import Core

class RootFlowController: FlowController {
    private let environmentClosure: () -> Environment
    private let flowAssembler: () -> FlowAssemblerProtocol
    private var cancellables = Set<AnyCancellable>()

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(environmentClosure: @escaping () -> Environment, flowAssembler: @escaping () -> FlowAssemblerProtocol) {
        self.environmentClosure = environmentClosure
        self.flowAssembler = flowAssembler

        super.init(nibName: nil, bundle: nil)
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        NotificationCenter.default.publisher(for: .loggedIn)
//            .sink(receiveValue: { [weak self] _ in
//                self?.authorized()
//            })
//            .store(in: &cancellables)
//        NotificationCenter.default.publisher(for: .loggedOut)
//            .sink(receiveValue: { [weak self] _ in
//                self?.unauthorized()
//            })
//            .store(in: &cancellables)
//    }

    override func start() {
        let controller = SceneAssembler.splash(
            context: Splash.Context(),
            wireframeClosure: { _ in
//                switch wireframe {
//                case .authorized:
//                    self?.authorized()
//                case .unauthorized:
//                    self?.unauthorized()
//                }
            }
        )(environmentClosure())
        add(child: controller)
    }

//    func unauthorized() {
//        let destinationController = flowAssembler().login()
//        transit(to: destinationController)
//        destinationController.start()
//    }
//
//    func authorized() {
//        let destinationController = flowAssembler().task()
//        transit(to: destinationController)
//        destinationController.start()
//    }

    private func transit(to destinationController: UIViewController) {
        if let current = root {
            remove(child: current)
        }
        add(child: destinationController)
    }

}
