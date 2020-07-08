//
//  FlowAssembler.swift
//  Mock-App
//
//  Created by hinomori-hiroya on 2020/07/08.
//

import Foundation
import Core

struct FlowAssembler: FlowAssemblerProtocol {

    private let environmentClosure: () -> Environment

    init(environmentClosure: @escaping () -> Environment) {
        self.environmentClosure = environmentClosure
    }

    func root() -> FlowController {
        RootFlowController(environmentClosure: environmentClosure, flowAssembler: { self })
    }

}
