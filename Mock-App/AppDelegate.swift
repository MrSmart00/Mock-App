//
//  AppDelegate.swift
//  Mock-App
//
//  Created by tawata-yu on 2019/10/28.
//  Copyright © 2019 DMM.com. All rights reserved.
//

import UIKit
import MockAPI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let flowAssembler = FlowAssembler(environmentClosure: {
            .init(networkService: NetworkService(baseURL: URL(string: "http://127.0.0.1:3200")),
                  accessTokenRepository: AccessTokenRepository(userDefaults: .standard))
        })
        let root = flowAssembler.root()
        root.start()

        window.rootViewController = root
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}
