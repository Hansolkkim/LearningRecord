//
//  CurrencyData.swift
//  ByteCoin
//
//  Created by κΉνμ on 2021/12/23.
//

protocol CoinManagerDelegate {
    func didUpdateCurrency(price: Double, currency: String)
    func didFailWithError(error: Error)
}

import Foundation

struct CoinData: Decodable {
    let rate: Double
}
