//
//  ViewController.swift
//  Flash Chat
//
//  Created by 김한솔 on 2021/12/23.
//

import UIKit
import CLTypingLabel

class WelComeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = K.appName
    }


}

