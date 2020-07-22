//
//  FlowAssembler.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import Foundation
import Core
import Domain

struct FlowAssembler: FlowAssemblerProtocol {

    private let environmentClosure: () -> Environment

    init(environmentClosure: @escaping () -> Environment) {
        self.environmentClosure = environmentClosure
    }

    func root() -> FlowController {
        RootFlowController(environmentClosure: environmentClosure, flowAssembler: { self })
    }

    func auth() -> NavigationFlowController {
        AuthenticationFlowController(environmentClosure: environmentClosure)
    }

    func mainTab() -> FlowController {
        MainTabFlowController(environmentClosure: environmentClosure, flowAssembler: { self })
    }

    func home() -> NavigationFlowController {
        HomeFlowController(environmentClosure: environmentClosure)
    }

    func subContent(mainTabClosure: ((MainTabItem) -> Void)? = nil) -> NavigationFlowController {
        SubContentFlowController(environmentClosure: environmentClosure, mainTabClosure: mainTabClosure)
    }
}
