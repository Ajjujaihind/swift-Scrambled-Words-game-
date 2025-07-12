//
//  LetterView.swift
//  ScrambledWords
//
//  Created by Ajay kumar on 11/07/25.
//

import Foundation
import SwiftUI

struct LetterView: View {
    let letter: Letter
    var body: some View {
        Text(letter.text)
            .font(.system(size: 15, weight: .bold))
            .foregroundStyle(Color.white).frame(width: 30, height: 30).background(Color.white.opacity(0.4)).clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
