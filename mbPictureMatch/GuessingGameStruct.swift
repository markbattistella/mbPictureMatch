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

	// pass the guess button to the array
	mutating func playerGuess( userGuessedWord: String ) {
		wordsGuessed.append( userGuessedWord )
	}

	// if the guess is in the array
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
