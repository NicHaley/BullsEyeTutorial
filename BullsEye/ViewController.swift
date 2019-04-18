//
//  ViewController.swift
//  BullsEye
//
//  Created by Nicholas Haley on 2019-04-17.
//  Copyright © 2019 Nicholas Haley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        let bonusPoints: Int
        
        if points == 100 {
            bonusPoints = 100
        } else {
            bonusPoints = 0
        }
        
        let totalPoints = points + bonusPoints
        let message = "You scored \(totalPoints) points"
        
        score += totalPoints
        
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert);
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        });
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        print("The value of the slider is now: \(roundedValue)")
    }
    
    @IBAction func reset() {
        currentValue = 0
        targetValue = 0
        score = 0
        round = 0
        
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

