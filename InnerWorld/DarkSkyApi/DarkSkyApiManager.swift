//
//  DarkSkyApi.swift
//  InnerWorld
//
//  Created by Linh Nguyen on 3/10/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import Foundation
enum DarkSkyApiError: Error {
    case failedRequest
    case invalidResponse
    case unknownError
}
class DarkSkyApi {
    private final let apiUrl = URL(string: "https://api.darksky.net/forecast")!
    private final let apiKey =
    "9885577ea36211205d5ff94ad6d2224d"
    private var baseURL: URL
    
    weak var delegate: DarkSkyApiDelegate?
    
    // Shared Properties
    private static var sharedInstance: DarkSkyApi = {
        let api = DarkSkyApi()
        return api
    }()
    
    // Accessors
    class func shared() -> DarkSkyApi {
        return sharedInstance
    }
    
    // Initialization
    private init() {
        baseURL = apiUrl.appendingPathComponent(apiKey)
    }
    
    func load(latitude: Double, longitude: Double) {
        let url = baseURL.appendingPathComponent("\(latitude),\(longitude)")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) {[weak self] (data, response, error) in
            self?.didFinishLoading(data: data, response: response, error: error)
        }
        dataTask.resume()
    }
    
    
    private func didFinishLoading(data: Data?, response: URLResponse?, error: Error?) {
        var dataManagerError = DarkSkyApiError.unknownError
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
            let weatherDailyData = try decoder.decode(ApiWeather.self, from: data)
            let model = Model.shared()
            model.finishLoadingApi(data: weatherDailyData)
            delegate?.apiCallback()
        } catch {
        }
    }
}

