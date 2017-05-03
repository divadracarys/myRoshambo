//
//  ResultsViewController.swift
//  myRoshambo
//
//  Created by Divya Kabra on 5/3/17.
//  Copyright © 2017 Divya Kabra. All rights reserved.
//

import Foundation
import UIKit
enum Shape: String {
    case Rock
    case Paper
    case Scissors
    
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
    
}

class ResultsViewController: UIViewController {
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    var usersChoice: Shape!
    let computersChoice: Shape = Shape.randomShape()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(usersChoice.rawValue) vs. \(computersChoice)"
        
        switch (usersChoice!, computersChoice) {
        case let (user, computer) where user == computer:
            text = "\(matchup): it's a tie"
            imageName = "tie"
        case (.Rock, .Scissors), (.Scissors, .Paper), (.Paper, .Rock):
            text = "You win: \(matchup)."
            imageName = "\(usersChoice.rawValue)-\(computersChoice)"
        default:
            text = "You lose: \(matchup)"
            imageName = "\(computersChoice)-\(usersChoice.rawValue)"
        }
        imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    @IBAction func playAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
