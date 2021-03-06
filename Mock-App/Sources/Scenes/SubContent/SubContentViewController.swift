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

    private let dependency: Dependency

    private var cancellables = Set<AnyCancellable>()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!

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

        detailButton.tapPublisher
            .sink { [weak self] (_) in
                self?.dependency.presenter.dispatch(.tappedDetail)
            }
            .store(in: &cancellables)

        logoutButton.tapPublisher
            .sink { [weak self] (_) in
                self?.dependency.presenter.dispatch(.tappedLogout)
            }
            .store(in: &cancellables)
    }

    private func bind(state: SubContent.State) {
        titleLabel.text = state.title
        detailButton.setTitle(state.buttonTitle, for: .normal)
    }

}
