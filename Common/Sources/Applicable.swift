//
//  Applicable.swift
//  Common
//
//  Created by hinomori-hiroya on 2020/07/11.
//

import Foundation

extension NSObject: Applicable {
}

public protocol Applicable { }

public extension Applicable where Self: NSObject {
    @discardableResult
    func apply(_ function: (Self) throws -> Void) rethrows -> Self {
        try function(self)
        return self
    }
}
