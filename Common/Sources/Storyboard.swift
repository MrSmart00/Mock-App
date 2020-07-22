//
//  Storyboard.swift
//  Common
//
//  Created by hinomori-hiroya on 2020/07/09.
//

import UIKit

public struct Storyboard<V> where V: UIViewController {
    let bundle: Bundle
    let name: String
    var identifier: String?

    public init(name: String, identifier: String? = nil, bundle: Bundle? = nil) {
        self.bundle = bundle ?? Bundle(for: V.self)
        self.name = name
        self.identifier = identifier
    }

    public func instantiate() -> V {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        let identifier = self.identifier ?? String(describing: V.self)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! V // swiftlint:disable:this force_cast
        return controller
    }
}

public extension Storyboard where V: Injectable {
    func instantiate(with dependency: V.Dependency) -> V {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateInitialViewController { (corder) in
            V.init(coder: corder, dependency: dependency)
        }!
    }
}
