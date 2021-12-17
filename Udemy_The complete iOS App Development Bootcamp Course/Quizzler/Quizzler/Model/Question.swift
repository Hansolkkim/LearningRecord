//
//  Question.swift
//  Quizzler
//
//  Created by 김한솔 on 2021/12/17.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnser: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnser = correctAnswer
    }
}
