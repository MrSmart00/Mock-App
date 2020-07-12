//
//  HomeFlowController.swift
//  Home
//
//  Created by hinomori-hiroya on 2020/07/09.
//

import UIKit
import Core

public class HomeFlowController: NavigationFlowController {

    private let environmentClosure: () -> Environment

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(environmentClosure: @escaping () -> Environment) {
        self.environmentClosure = environmentClosure

        super.init(nibName: nil, bundle: nil)
    }

    public override func start() {
        let controller = SceneAssembler.Home(
            context: .init(),
            wireframeClosure: { _ in  }
        )(environmentClosure())
        navigation.viewControllers = [controller]
    }

}
