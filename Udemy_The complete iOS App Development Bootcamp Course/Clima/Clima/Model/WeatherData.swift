//
//  WeatherData.swift
//  Clima
//
//  Created by 김한솔 on 2021/12/21.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
