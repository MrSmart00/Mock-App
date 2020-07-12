//
//  MainTabViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 12/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common

final class MainTabViewController: UITabBarController, Injectable {
    struct Dependency {
        let presenter: MainTabPresenterProtocol
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func inject(dependency: MainTabViewController.Dependency) {
        self.dependency = dependency
    }
}
