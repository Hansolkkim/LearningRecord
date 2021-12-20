//
//  TipBrain.swift
//  Tipsy
//
//  Created by 김한솔 on 2021/12/20.
//

import Foundation

struct TipBrain {
    var tip: Float?
    var numberOfPeople: Int?
    var totalBillPerPerson: Float?
    
    mutating func setTip(_ tip: String) {
        self.tip = Float(Int(String(Array(tip)[0]))!)/Float(10)
    }
    
    mutating func calculateTotalBill(numberOfPeople: String, bill: String) {
        self.numberOfPeople = Int(numberOfPeople)!
        totalBillPerPerson = (Float(bill)! * (1+(tip ?? 0.0)) / Float(numberOfPeople)!)
    }
    
    func getTotalBillPerPerson() -> Float {
        return totalBillPerPerson ?? 0
    }
    
    func getNumberOfPeople() -> Int {
        return numberOfPeople ?? 0
    }
    
    func getTip() -> Float {
        return tip ?? 0
    }
    
}
