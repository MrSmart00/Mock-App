//
//  HomeViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
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
            .sink(receiveValue: { [weak self] in self?.bind(state: $0) })
            .store(in: &cancellables)
    }

    func inject(dependency: HomeViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: Home.State) {
        titleLabel.text = state.title
    }

}
