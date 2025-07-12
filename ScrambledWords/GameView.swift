//
//  ContentView.swift
//  ScrambledWords
//

//id: \.self    Unique values (e.g., ["A", "B", "C"])    ForEach(letters, id: \.self)
//    Identifiable    Duplicates possible (e.g., ["A", "B", "A"])    ForEach(letters) { ... }
                      
                      /// same like ListView.builder() and \.self like key for udentify unique

import SwiftUI

struct GameView: View {
    @State var guessedLetters: [Letter] = []
    @State private var showSuccess: Bool = false
    @State private var showFailure: Bool = false
    @State private var score = 0
    @State private var showFinalScore = false
    @State var questions: [Question] = Question.generateQuestion()
    @State private var currentQuestionIndex = 0
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.background.ignoresSafeArea()
                
                mainContentView(proxy: proxy)
                
                if showFailure {
                    failureOverlay
                }
                
                if showSuccess {
                    successOverlay
                }
            }
        }
        .sheet(isPresented: $showFinalScore) {
            resetGame()
        } content: {
            ScoreView(score: score, questionCount: questions.count)
        }
    }
    
    // MARK: - Main Content View
    private func mainContentView(proxy: GeometryProxy) -> some View {
        VStack {
            gameAreaView(proxy: proxy)
            scoreView
            scrambledLettersView
        }
    }
    
    // MARK: - Game Area View
    private func gameAreaView(proxy: GeometryProxy) -> some View {
        VStack {
            Spacer()
            
            questionImageView
            
            Spacer()
            
            guessedLettersView
        }
        .frame(width: proxy.size.width * 0.9, height: proxy.size.width * 0.9)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.border, lineWidth: 3)
        }
    }
    
    // MARK: - Question Image View
    private var questionImageView: some View {
        Image(questions[currentQuestionIndex].image)
            .resizable()
            .frame(width: 100, height: 100)
    }
    
    // MARK: - Guessed Letters View
    private var guessedLettersView: some View {
        HStack {
            ForEach(Array(guessedLetters.enumerated()), id: \.1) { index, guessedLetter in
                guessedLetterView(guessedLetter: guessedLetter, index: index)
            }
        }
        .padding(.bottom, 20)
    }
    
    private func guessedLetterView(guessedLetter: Letter, index: Int) -> some View {
        VStack {
            Text(guessedLetter.text)
                .padding()
                .background(Color.white)
                .onTapGesture {
                    handleGuessedLetterTap(guessedLetter: guessedLetter, index: index)
                }
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 25, height: 3)
        }
    }
    
    // MARK: - Score View
    private var scoreView: some View {
        Text("Score: \(score)")
            .foregroundStyle(Color.white)
            .font(.title)
            .fontWeight(.bold)
            .padding(.top)
    }
    
    // MARK: - Scrambled Letters View
    private var scrambledLettersView: some View {
        HStack {
            ForEach(Array(questions[currentQuestionIndex].scramledLetters.enumerated()), id: \.1) { index, letter in
                scrambledLetterView(letter: letter, index: index)
            }
        }
    }
    
    private func scrambledLetterView(letter: Letter, index: Int) -> some View {
        Text(letter.text)
            .padding()
            .background(Color.white)
            .onTapGesture {
                handleScrambledLetterTap(letter: letter, index: index)
            }
    }
    
    // MARK: - Overlay Views
    private var failureOverlay: some View {
        VStack {
            Image("cross")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.2))
    }
    
    private var successOverlay: some View {
        VStack {
            Image("tick")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.2))
    }
    
    // MARK: - Action Handlers
    private func handleGuessedLetterTap(guessedLetter: Letter, index: Int) {
        // Find the corresponding scrambled letter and restore its text
        if let scrambledIndex = questions[currentQuestionIndex].scramledLetters.firstIndex(where: { $0.id == guessedLetter.id }) {
            questions[currentQuestionIndex].scramledLetters[scrambledIndex].text = guessedLetter.text
        }
        guessedLetters.remove(at: index)
    }
    
    private func handleScrambledLetterTap(letter: Letter, index: Int) {
        guard !letter.text.isEmpty else { return }
        
        guessedLetters.append(letter)
        questions[currentQuestionIndex].scramledLetters[index].text = ""
        print("Click on Letter: \(letter.text)")
        
        if guessedLetters.count == questions[currentQuestionIndex].scramledLetters.count {
            checkAnswer()
        }
    }
    
    private func checkAnswer() {
        let guessedAnswer = guessedLetters.map { $0.text }.joined()
        let isCorrect = guessedAnswer == questions[currentQuestionIndex].correctAnswer
        
        if isCorrect {
            showSuccess = true
            score += 1
        } else {
            showFailure = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showSuccess = false
            showFailure = false
            
            if currentQuestionIndex == questions.count - 1 {
                showFinalScore = true
            } else {
                currentQuestionIndex += 1
            }
        }
        
        guessedLetters.removeAll()
    }
    
    private func resetGame() {
        questions = Question.generateQuestion()
        currentQuestionIndex = 0
        score = 0
    }
}
#Preview {
    GameView()
}

