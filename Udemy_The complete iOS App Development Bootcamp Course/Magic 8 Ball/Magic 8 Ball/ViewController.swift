//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by 김한솔 on 2021/12/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
        
    @IBAction func askButtonPressed(_ sender: UIButton) {
        let ballImageArray = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball5")]
        imageView.image = ballImageArray.randomElement()
    }
    
}

