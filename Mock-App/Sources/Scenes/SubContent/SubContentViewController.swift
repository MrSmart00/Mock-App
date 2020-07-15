//
//  SubContentViewController.swift
//  Mock-App
//
//  Created by Hiroya Hinomori on 15/07/2020.
//  Copyright © 2020 hoge.company. All rights reserved.
//

import Foundation
import UIKit
import Combine
import Common
import CombineCocoa

final class SubContentViewController: UIViewController, SubContentView, Injectable {
    struct Dependency {
        let presenter: SubContentPresentation
    }

    private var dependency: Dependency!

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var detailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        dependency.presenter.state
            .sink(receiveValue: { [weak self] in self?.bind(state: $0) })
            .store(in: &cancellables)

        detailButton.tapPublisher
            .sink { [weak self] (_) in
                self?.dependency.presenter.dispatch(.tappedDetail)
            }
            .store(in: &cancellables)
    }

    func inject(dependency: SubContentViewController.Dependency) {
        self.dependency = dependency
    }

    private func bind(state: SubContent.State) {
        // TODO: layout a view from state
    }

}
