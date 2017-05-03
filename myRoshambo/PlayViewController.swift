//
//  PlayViewController.swift
//  myRoshambo
//
//  Created by Divya Kabra on 5/3/17.
//  Copyright © 2017 Divya Kabra. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    
// MARK: CODE ONLY- ROCK
    @IBAction func rock (_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        vc.usersChoice = getUserShape(sender)
        present(vc, animated: true, completion: nil)
        
    }
    
    // MARK: CODE+SEGUE - PAPER
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paperSegue" {
            let vc = segue.destination as! ResultsViewController
            vc.usersChoice = getUserShape(sender as! UIButton)
        }
    }
    
    @IBAction func paper(_ sender: UIButton) {
        performSegue(withIdentifier: "paperSegue", sender: sender)
    }
    
    
    
    
    
    func getUserShape(_ sender: UIButton) -> Shape{
        // still do not know what this line does
        let shape = sender.title(for: UIControlState())
        return Shape(rawValue: shape!)!
    }

}

