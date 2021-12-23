//
//  CurrencyData.swift
//  ByteCoin
//
//  Created by 김한솔 on 2021/12/23.
//

protocol CoinManagerDelegate {
    func didUpdateCurrency(price: Double, currency: String)
    func didFailWithError(error: Error)
}

import Foundation

struct CurrencyData: Decodable {
    let rate: Double
}
