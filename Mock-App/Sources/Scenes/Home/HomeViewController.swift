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

    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        dependency.presenter.state
            .sink(receiveValue: bind(state:))
            .store(in: &cancellables)
    }

    func inject(dependency: HomeViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: HomeState) {
        titleLabel.text = state.title
    }
}
