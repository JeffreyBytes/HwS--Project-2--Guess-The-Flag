//
//  ViewController.swift
//  Project2
//
//  Created by Jeffrey Carpenter on 6/25/20.
//  Copyright © 2020 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreButton: UIBarButtonItem!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCountries()
        setupUI()
        askQuestion()
    }
    
    // MARK: - Functions
    
    func setupCountries() {
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        // select the correct answer
        correctAnswer = Int.random(in: 0...2)
        
        // shuffle the array
        countries.shuffle()
        
        // set title to correct answer
        self.title = countries[correctAnswer].uppercased()
        
        // select the first three images from the array
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func newGame(action: UIAlertAction! = nil) {
        
        score = 0
        questionNumber = 1
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        questionNumber += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        if questionNumber <= 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Final Score", message: "You completed 10 rounds, your final score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "New Game", style: .default, handler: newGame))
            present(ac, animated: true)
        }
    }
    
    // MARK: - UI Functions
    
    func setupUI() {
        
        // add 1 point border around each button
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // set border color to light gray
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }

}

