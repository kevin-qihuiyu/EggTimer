//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
        
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    var remainingTime = 0
    var timerTime = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
        
    @IBAction func SelectedHardness(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle

        switch hardness {
        case "Soft":
            remainingTime = 5
            timerTime = 5
        case "Medium":
            remainingTime = 9
            timerTime = 9
        case "Hard":
            remainingTime = 12
            timerTime = 12
        default:
            print("error")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(updateCounter),
                             userInfo: nil,
                             repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if remainingTime > 0 {
            print("\(remainingTime) seconds.")
            remainingTime -= 1
            progressBar.progress = 1 - Float(remainingTime)/Float(timerTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    

}
