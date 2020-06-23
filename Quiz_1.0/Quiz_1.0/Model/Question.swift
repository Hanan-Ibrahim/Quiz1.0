//
//  Question.swift
//  Quiz_1.0
//
//  Created by Hanoudi on 6/22/20.
//  Copyright © 2020 Hanan. All rights reserved.
//
//  This is the structure of the question
import Foundation

struct Question {
    // Variables
    let question: String
    let answer: String
  
    // Initializer 
    init(q: String, a: String) {
        question = q
        answer = a
    }
}

    
