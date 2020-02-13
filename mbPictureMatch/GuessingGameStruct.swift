//
//  GuessingGameStruct.swift
//  mbPictureMatch
//
//  Created by Mark Battistella on 13/2/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import Foundation

struct GuessingGame {
    
    // variables
    var wordToGuess: String
    var wordsGuessed: [String]
	var playerScore: Int


	//
    var formattedWord: String {

		// the guessed word
		var guessedWord = ""
        
		// if the word is in the guesses
		if wordsGuessed.contains(wordToGuess) {
                guessedWord += "\(wordToGuess)"
        }
        return guessedWord
		
    }
}
