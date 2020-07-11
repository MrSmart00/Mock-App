//
//  FlowAssemblerProtocol.swift
//  Core
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit

public protocol FlowAssemblerProtocol {
    func root() -> FlowController
    func mainTab() -> FlowController
    func home() -> NavigationFlowController
    func subContent() -> NavigationFlowController
    // TODO: Add directions
}
