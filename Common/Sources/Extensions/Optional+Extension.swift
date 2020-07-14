//
//  Optional+Extension.swift
//  Common
//
//  Created by hinomori-hiroya on 2020/07/14.
//

import Foundation

public extension Optional {
    var isNil: Bool {
        if case .some = self {
            return false
        } else {
            return true
        }
    }

    func condition(where: (Wrapped) -> Bool) -> Bool {
        switch self {
        case .some(let wrapped):
            return `where`(wrapped)
        case .none:
            return false
        }
    }

    func compact(_ where: (Wrapped) -> Void) {
        switch self {
        case .some(let wrapped):
            return `where`(wrapped)
        case .none:
            return
        }
    }
}
