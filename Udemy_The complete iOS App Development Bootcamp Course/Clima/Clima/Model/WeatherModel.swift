//
//  WeatherModel.swift
//  Clima
//
//  Created by 김한솔 on 2021/12/21.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ WeatherManeger: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232, 801...804: return "cloud.bolt"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "cloud.snow"
        case 701...781: return "cloud.fog"
        case 800: return "sun.max"
        default: return "cloud"
        }
    }
}
