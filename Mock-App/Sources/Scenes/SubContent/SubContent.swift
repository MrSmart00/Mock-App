//
//  SubContent.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit

enum SubContent {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {
        case detail
    }
}

protocol SubContentUsecase {

}

public enum SubContentMessage {
    case tappedDetail
}

protocol SubContentPresentation {
    func dispatch(_ message: SubContentMessage)
}

protocol SubContentView: UIViewController {

}
