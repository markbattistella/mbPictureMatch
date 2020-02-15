//
//  GameOverViewController.swift
//  mbPictureMatch
//
//  Created by Mark Battistella on 1/2/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit


class GameOverViewController: UIViewController {
    
    // create some variables - passed from previous VC
    var currentGameScore: Int = 0
    var currentHighScore: Int = 0
    
    // IB variable
    @IBOutlet var currentScoreSavedLabel: UILabel!
    @IBOutlet var currentHighScoreLabel: UILabel!
    @IBOutlet var specialOutcomeLabel: UILabel!
    
    // IB function
    @IBAction func playAgainButton(_ sender: Any) {

        // close the modal
        dismiss(animated: true, completion: nil)
    }
	

	override func viewDidLoad() {
        super.viewDidLoad()

        // update the labels
        currentScoreSavedLabel.text = "You scored\n\(currentGameScore) correct"
        currentHighScoreLabel.text = "The current high score is\n\(currentHighScore) correct"
        
        // if the score is equal
        if currentGameScore == currentHighScore {
            specialOutcomeLabel.text = "You matched the high score!"

        // if the new score is the high score
        } else if currentGameScore > currentHighScore {
            specialOutcomeLabel.text = "You now have the high score!"

        // if the user score was lower than the high score
        } else {
            specialOutcomeLabel.isHidden = true
        }
    }
}
