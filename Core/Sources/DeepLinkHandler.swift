//
//  DeepLinkHandler.swift
//  Core
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import Foundation
import UIKit

public enum DeepLinkOption {
    case none
}

public protocol DeepLinkHandler: UIViewController {
    @discardableResult
    func handle(_ option: DeepLinkOption) -> Bool
}

extension DeepLinkHandler {
    public func handle(_ option: DeepLinkOption) -> Bool {
        let handlers = children.compactMap { $0 as? DeepLinkHandler }

        for handler in handlers {
            if handler.handle(option) {
                return true
            }
        }

        return false
    }
}
