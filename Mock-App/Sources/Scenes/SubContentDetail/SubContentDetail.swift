//
//  SubContentDetail.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import UIKit

enum SubContentDetail {
    public struct Context {
        public init() {}
    }

    public enum Wireframe {
        case home
    }
}

protocol SubContentDetailUsecase {

}

public enum SubContentDetailMessage {
    case tappedHome
}

protocol SubContentDetailPresentation {
    func dispatch(_ message: SubContentDetailMessage)
}

protocol SubContentDetailView: UIViewController {

}
