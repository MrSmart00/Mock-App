//
//  Injectable.swift
//  Common
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import Foundation

public protocol Injectable {
    associatedtype Dependency

    func inject(dependency: Dependency)
}
