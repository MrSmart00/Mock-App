//
//  NavigationFlowController.swift
//  Core
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit

open class NavigationFlowController: UIViewController, DeepLinkHandler {
    public let navigation = UINavigationController()

    public var root: UIViewController? {
        navigation.viewControllers.first
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }

    open func start() {}

    open func handle(_ option: DeepLinkOption) -> Bool {
        if let handler = root as? DeepLinkHandler {
            if handler.handle(option) {
                return true
            }
        }

        return false
    }

    private func commonInit() {
        addChild(navigation)
        view.addSubview(navigation.view)
        navigation.didMove(toParent: self)

        navigation.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                navigation.view.topAnchor.constraint(equalTo: view.topAnchor),
                navigation.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                navigation.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                navigation.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ]
        )
    }

    public func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    public func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}
