//
//  Question.swift
//  Quizzler
//
//  Created by James Daniel Malvern on 31/01/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

// this class can then be used as a type elsewhere
class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
