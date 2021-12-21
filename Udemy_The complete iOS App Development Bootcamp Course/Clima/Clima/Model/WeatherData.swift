//
//  WeatherData.swift
//  Clima
//
//  Created by 김한솔 on 2021/12/21.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}
