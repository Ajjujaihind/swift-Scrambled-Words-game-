//
//  ScoreView.swift
//  ScrambledWords
//
//  Created by Ajay kumar on 11/07/25.
//

import SwiftUI

struct ScoreView: View {
    
    let score : Int
    let questionCount :  Int
    var body: some View {
ZStack
        {
            Color.background.ignoresSafeArea()
            VStack
            {
                Text("Final Score").foregroundStyle(.white).font(.system(size: 25, weight: .bold))
                Text("Score: \(score) / \(questionCount)").foregroundStyle(.white)
                
            }
            
        }
    }
}

#Preview {
    ScoreView(score: 2,questionCount: 3)
}
