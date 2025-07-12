//
//  QustionModel.swift
//  ScrambledWords
//
//  Created by Ajay kumar on 08/07/25.
//

import Foundation

struct Question

{
    let image: String
    var scramledLetters : [Letter]
    let correctAnswer  : String
}
//let question = Question(image: <#T##String#>, scramledLetters: <#T##[Letter]#>, correctAnswer: <#T##String#>)

extension Question
{
  static  func generateQuestion() -> [Question]
    {
        return [
            
            Question(
                image: "orange", scramledLetters: [  Letter(id: 0, text: "O"),
                                                          Letter(id: 1, text: "R"),
                                                          Letter(id: 2, text: "A"),
                                                          Letter(id: 3, text: "N"),
                                                          Letter(id: 4, text: "G"),
                                                          Letter(id: 5, text: "E"),], correctAnswer: "ORANGE"
            ),
            
            Question(
                image: "apple", scramledLetters: [  Letter(id: 0, text: "P"),
                                                          Letter(id: 1, text: "P"),
                                                          Letter(id: 2, text: "A"),
                                                          Letter(id: 3, text: "L"),
                                                          Letter(id: 4, text: "E"),
                                                          ], correctAnswer: "APPLE"
            )
            ,
            Question(
                image: "banana", scramledLetters: [  Letter(id: 0, text: "A"),
                                                          Letter(id: 1, text: "N"),
                                                          Letter(id: 2, text: "B"),
                                                          Letter(id: 3, text: "A"),
                                                          Letter(id: 4, text: "N"),
                                                     Letter(id: 5, text: "A"),
                                                          ], correctAnswer: "BANANA"
            )
        ]
    }
}
