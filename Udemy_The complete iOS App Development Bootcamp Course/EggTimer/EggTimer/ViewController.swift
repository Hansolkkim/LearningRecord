//
//  ViewController.swift
//  EggTimer
//
//  Created by 김한솔 on 2021/12/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle ?? "Hard"//Soft, Medium, Hard
        self.totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
        } else {
            timer.invalidate()
            playDoneSound()
            titleLabel.text = "DONE!"
        }
    }
    
    func playDoneSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
