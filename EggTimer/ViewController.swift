//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3,"Medium": 4,"Hard": 7]
    var timer = Timer()
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let text = sender.currentTitle {
            if let time = eggTimes[text] {
                timer.invalidate()
                titleLabel.text = "\(text) eggs in progress"
                totalTime = time
                secondsPassed = 0
                startTimer()
            }else{
                print("Error! no time")
            }
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        //print("\(timeFormatted(totalTime))")
        let percentage = Float(secondsPassed) / Float(totalTime)
        progressBar.progress = percentage
        if secondsPassed < totalTime {
            secondsPassed += 1
        } else {
            endTimer()
        }
    }
    func endTimer() {
        titleLabel.text = "DONE!"
        timer.invalidate()
        playAlarm()
    }
    
   func playAlarm() {
       let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")

       player = try! AVAudioPlayer(contentsOf: url!)
       player.play()
   }

}
