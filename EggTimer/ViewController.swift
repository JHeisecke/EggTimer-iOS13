//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300,"Medium": 420,"Hard": 720]
    var timer: Timer!
    var totalTime: Int = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let text = sender.currentTitle {
            if let time = eggTimes[text] {
                totalTime = time
                if timer != nil {
                    endTimer()
                }
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
        print("\(timeFormatted(totalTime))")

        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    func endTimer() {
        timer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

}
