//
//  HomeViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common

final class HomeViewController: UIViewController, Injectable {
    struct Dependency {
        let presenter: HomePresenterProtocol
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func inject(dependency: HomeViewController.Dependency) {
        self.dependency = dependency
    }
}
