//
//  FlowAssemblerProtocol.swift
//  Core
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import UIKit
import Domain

public protocol FlowAssemblerProtocol {
    func root() -> FlowController
    func auth(completion: () -> Void) -> NavigationFlowController
    func mainTab() -> FlowController
    func home() -> NavigationFlowController
    func subContent(mainTabClosure: ((MainTabItem) -> Void)?) -> NavigationFlowController
    // TODO: Add directions
}
