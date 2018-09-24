//
//  Configuration.swift
//  InnerWorld
//
//  Created by Jacky Tang on 20/9/18.
//  Copyright © 2018 Linh Nguyen. All rights reserved.
//

import Foundation
struct API {
    static let baseURL = URL(string: "https://api.darksky.net/forecast")!
    static let apiKey =
    "9885577ea36211205d5ff94ad6d2224d"
    static let authenticatedURL = baseURL.appendingPathComponent(apiKey)
}
