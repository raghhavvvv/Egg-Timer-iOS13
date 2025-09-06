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
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var counter = 60
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = Int(0.0)
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
        @objc func updateCounter() {
        if secondsPassed < counter {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(counter)
            print(Float(secondsPassed) / Float(counter))

        }else{
            timer.invalidate()
            titleLabel.text = "DONE"
        }
            
    }
}
