//
//  FlowController.swift
//  Core
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit

open class FlowController: UIViewController, DeepLinkHandler {

    public var root: UIViewController? {
        children.first
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

}

extension FlowController {
    public func add(child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)

        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                child.view.topAnchor.constraint(equalTo: view.topAnchor),
                child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ]
        )
    }

    public func remove(child: UIViewController) {
        child.willMove(toParent: self)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
