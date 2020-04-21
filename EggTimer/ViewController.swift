//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let text = sender.currentTitle {
            switch text {
            case "Hard":
                print(12)
            case "Medium":
                print(7)
            case "Soft":
                print(5)
            default:
                print("Option not valid!")
            }
        }
    }
}
