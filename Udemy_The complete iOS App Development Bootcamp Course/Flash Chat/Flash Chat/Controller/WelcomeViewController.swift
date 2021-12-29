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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) //override를 할 때마다 부모의 해당 함수를 호출해주는 것을 습관삼아야한다.
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = K.appName
    }


}

