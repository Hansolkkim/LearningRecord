//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 김한솔 on 2021/12/20.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var calculatedTip: Float?
    var numberOfPeople: Int?
    var tip: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", self.calculatedTip ?? 0.0)
        settingsLabel.text = "Split between \(numberOfPeople ?? 0) people, with \(Int((tip ?? 0) * 100))% tip"
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
