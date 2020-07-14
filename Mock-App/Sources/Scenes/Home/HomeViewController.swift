//
//  HomeViewController.swift
//  Mock-App
//
//  Created by Hinomori Hiroya on 14/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common

final class HomeViewController: UIViewController, HomeView, Injectable {
    struct Dependency {
        let presenter: HomePresentation
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
