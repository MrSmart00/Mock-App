//
//  MockAppNetwork.swift
//  Core
//
//  Created by 日野森寛也 on 2020/07/22.
//

import Foundation
import MockAPI

public enum MockAppNetwork {
    public static func local() -> NetworkServiceType {
        NetworkService(baseURL: URL(string: "http://127.0.0.1:3200")!)
    }
}
