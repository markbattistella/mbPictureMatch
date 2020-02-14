//
//  ViewController.swift
//  mbPictureMatch
//
//  Created by Mark Battistella on 13/2/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // variables
    var fruitsToGuess = ["Lemon", "Apple", "Orange", "Strawberry", "Grapes", "Cherry"]
    var fruitsToGuessShuffled = [String]()
    var fruitsToGuessNumber = 0
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var highScore = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: GuessingGame! // ! is to allow empty values on load
    
    // IB variable
    @IBOutlet var currentGameScoreLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    @IBOutlet var wordToGuessLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!

    // IB function
    @IBAction func buttonImagePressed(_ sender: UIButton) {
        
        // disable on tap
        sender.isEnabled = false
        
        // get the button title
        let buttonImageTitle = sender.currentTitle!
        
        // pass the guess to the struct
        currentGame.playerGuess( userGuessedWord: "\(buttonImageTitle)" )

        // check the win-lose staus
        updateGameState()
    }

    
    
    override func viewDidLoad() {
		super.viewDidLoad()
        
        // initiate new round
        newRound()
        
	}



    // function: new round
    func newRound() {
        
        // if there are fruits remaining
//        if !fruitsToGuessShuffled.isEmpty {
        if totalWins <= 6 {

            // shuffle the fruit names
            fruitsToGuessShuffled = shuffleArray(stringArray: fruitsToGuess)

            // add the fruit name to the label based off array key
            let currentFruit = fruitsToGuessShuffled[fruitsToGuessNumber]
            wordToGuessLabel.text = currentFruit

            // start with a new word, guessed fruits, and the player score
            currentGame = GuessingGame(wordToGuess: currentFruit, wordsGuessed: [], playerScore: totalWins)
            
            // re-enable all the buttons
            imageButtonState(true)
            
            // update the UI
            updateUI()

        } else {

            // leave the button states
            imageButtonState(false)

        }

    }
    
    // function: update interface
    func updateUI() {

        // show the current score
        currentGameScoreLabel.text = "Current score\n\(totalWins)"
        
        // debug: list outputs
        print( fruitsToGuessShuffled )

        
    }

    // function: update game state
    func updateGameState() {

        // guessed word match: win game
        if currentGame.wordToGuess == currentGame.formattedWord {
            
            // add to the current score
            totalWins += 1
            
            // increment the fruit array number
            fruitsToGuessNumber += 1
            
            
            //
            //
            //
            // remove from array
//            fruitsToGuessShuffled.remove(at: fruitsToGuessNumber)
//            fruitsToGuessShuffled = fruitsToGuessShuffled.filter {$0 != currentGame.wordToGuess} // https://stackoverflow.com/a/24092728
            //
            //
            //

        } else {

            // otherwise update the interface
            updateUI()
        }
    }
    
    // function: update button state
    func imageButtonState(_ enable: Bool) {
        
        // loop through the buttons and re-enable them
        for button in buttonCollection {
            button.isEnabled = enable
            button.alpha = 1
        }
    }

}
