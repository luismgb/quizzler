//
//  Question.swift
//  Quizzler
//
//  Created by Luis M Gonzalez on 12/19/17.
//  Copyright © 2017 Luis M Gonzalez. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}
