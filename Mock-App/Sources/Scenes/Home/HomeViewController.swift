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

    private let dependency: Dependency

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var titleLabel: UILabel!

    init?(coder: NSCoder, dependency: Dependency) {
        self.dependency = dependency
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dependency.presenter.state
            .sink(receiveValue: { [weak self] in self?.bind(state: $0) })
            .store(in: &cancellables)
    }

    private func bind(state: Home.State) {
        titleLabel.text = state.title
    }

}
