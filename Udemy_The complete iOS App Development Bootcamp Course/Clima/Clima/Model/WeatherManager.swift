//
//  WeatherManager.swift
//  Clima
//
//  Created by 김한솔 on 2021/12/21.
//

import Foundation
import CoreLocation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1a07f2c8ffffd2b498e7eb907f4e090f&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeater(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequset(with: urlString)
    }
    
    func fetchWeather(latitute: CLLocationDegrees, longitute: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitute)&lon=\(longitute)"
        performRequset(with: urlString)
    }
    
    func performRequset(with urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, respose, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) { //클로저에서 해당 struct 내부의 함수를 호출할 경우 self. 키워드가 필요하다.(나는 없어도 오류가 안나는데?)
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
        }
        return nil
    }
    


}
