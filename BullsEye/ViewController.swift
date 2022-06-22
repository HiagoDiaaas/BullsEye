//
//  ViewController.swift
//  BullsEye
//
//  Created by Hiago Santos Martins Dias on 21/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    var targetValue = 0
    var currentValue: Int = 0
    var score = 0
    var round = -1
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points        // add this line
        let message = "You scored \(points) points"
        
      
      let alert = UIAlertController(
        title: "Hello, World",
        message: message,    // changed
        preferredStyle: .alert)
      let action = UIAlertAction(
        title: "OK",          // changed
        style: .default,
        handler: nil)
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
      startNewRound()
        
    }
   
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
   }
    
    

}

