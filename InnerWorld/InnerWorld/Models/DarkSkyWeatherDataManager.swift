//
//  DarkSkyWeatherDataManager.swift
//  InnerWorld
//
//  Created by Jacky Tang on 20/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import Foundation
enum DarkSkyWeatherDataManagerError: Error {
    case failedRequest
    case invalidResponse
    case unknownError
}
final class DarkSkyWeatherDataManager {
    //init
    private let baseURL: URL

    private init(baseURL: URL) {
        self.baseURL = baseURL
    }

    static let shared = DarkSkyWeatherDataManager(baseURL: API.authenticatedURL)
    //callback
    typealias CompletionHandler = (DarkSkyWeatherData?, DarkSkyWeatherDataManagerError?) -> Void

    func weatherDataAt(latitude: Double, longitude: Double, completion: @escaping CompletionHandler) {
        let url = baseURL.appendingPathComponent("\(latitude),\(longitude)")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let dataTask = URLSession.shared.dataTask(with: request) {[weak self] (data, response, error) in
            self?.didFinishGettingWeatherData(data: data, response: response, error: error, completionHandler: completion)
        }
        dataTask.resume()
    }

    private func didFinishGettingWeatherData(data: Data?, response: URLResponse?, error: Error?, completionHandler: @escaping CompletionHandler) {
        var dataManagerError = DarkSkyWeatherDataManagerError.unknownError
        let decoder = JSONDecoder()
        do {
            if let _ = error {
                dataManagerError = .failedRequest
                throw dataManagerError
            }
            guard let data = data else {
                dataManagerError = .invalidResponse
                throw dataManagerError
            }
            let weatherDailyData = try decoder.decode(DarkSkyWeatherData.self, from: data)
            completionHandler(weatherDailyData, nil)
        } catch {
            completionHandler(nil, dataManagerError)
        }
    }
}
