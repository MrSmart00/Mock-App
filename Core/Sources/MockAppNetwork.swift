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

public enum SceneError: Error {
    case never
    case error(title: String?, message: String?)

    public static func convert(_ apiError: APIError) -> Self {
        switch apiError {
        case .statusCode(let response), .response(let response):
            if let error: ServerError = parse(with: response.data) {
                return .error(title: error.title, message: error.message)
            } else if let errorJson: [String: String] = parse(with: response.data) {
                return .error(title: nil, message: errorJson["message"])
            } else if let errorString: String = parse(with: response.data) {
                return .error(title: nil, message: errorString)
            } else {
                return .never
            }
        default:
            return .never
        }
    }

    private static func parse(with errorData: Data) -> ServerError? {
        return try? JSONDecoder().decode(ServerError.self, from: errorData)
    }

    private static func parse(with errorData: Data) -> [String: String]? {
        return try? JSONSerialization
            .jsonObject(with: errorData, options: .allowFragments) as? [String: String]
    }

    private static func parse(with errorData: Data) -> String? {
        return String(data: errorData, encoding: .utf8)
    }

}
