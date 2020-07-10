//
//  FlowAssemblerProtocol.swift
//  Core
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit

public protocol FlowAssemblerProtocol {
    func root() -> FlowController
    func mainTab() -> NavigationFlowController
    func home() -> NavigationFlowController
    // TODO: Add directions
}
