# ScrambledWords 🎮

A fun and educational iOS word puzzle game built with SwiftUI where players unscramble letters to spell words based on visual clues.

## 📱 About

ScrambledWords is an interactive word puzzle game that challenges players to arrange scrambled letters to form the correct word. The game presents an image as a hint, and players must tap on the scrambled letters in the correct order to spell the corresponding word.

## ✨ Features

- **Visual Clues**: Each puzzle includes an image hint to help players identify the target word
- **Interactive Gameplay**: Tap letters to build your answer, tap again to remove them
- **Score Tracking**: Keep track of your correct answers throughout the game
- **Multiple Questions**: Play through a series of word puzzles
- **Instant Feedback**: Visual success/failure indicators for each answer
- **Final Score Display**: Review your performance at the end of the game

## 🎯 How to Play

1. Look at the image displayed on screen
2. Tap the scrambled letters at the bottom to spell the word
3. Tapped letters appear in the answer area above
4. Tap letters in the answer area to remove them if needed
5. Complete the word to see if you got it right!
6. Progress through all questions to see your final score

## 🏗️ Project Structure

```
ScrambledWords/
├── ScrambledWordsApp.swift      # Main app entry point
├── GameView.swift               # Main game interface and logic
├── Models/
│   ├── LetterModel.swift        # Letter data model
│   └── QustionModel.swift       # Question data model with game data
├── View/
│   ├── LetterView.swift         # Letter display component
│   └── ScoreView.swift          # Score display component
├── Assets.xcassets/             # Game images (apple, banana, orange, etc.)
└── Colors.xcassets/             # Custom color themes
```

## 🛠️ Technical Details

- **Platform**: iOS
- **Framework**: SwiftUI
- **Language**: Swift
- **Architecture**: MVVM pattern
- **UI Components**: Custom views with SwiftUI

### Key Components

- **Letter Model**: Identifiable and Hashable structure for individual letters
- **Question Model**: Contains image reference, scrambled letters, and correct answer
- **Game Logic**: Handles letter selection, answer validation, and score tracking
- **Visual Feedback**: Success/failure overlays with custom animations

## 🎨 Assets

The game includes custom images for:
- 🍎 Apple
- 🍌 Banana  
- 🍊 Orange
- ✅ Success indicator
- ❌ Failure indicator

## 🚀 Getting Started

### Prerequisites

- Xcode 12.0 or later
- iOS 14.0 or later
- macOS Big Sur or later

### Installation

1. Clone or download the project
2. Open `ScrambledWords.xcodeproj` in Xcode
3. Select your target device or simulator
4. Press `Cmd + R` to build and run

## 🎮 Game Flow

1. **Game Start**: First question loads with image and scrambled letters
2. **Letter Selection**: Player taps letters to form words
3. **Answer Validation**: Game checks if formed word matches correct answer
4. **Progress**: Move to next question or show final score
5. **Game End**: Display final score and option to restart

## 🔧 Customization

### Adding New Questions

To add new word puzzles, modify the `generateQuestion()` method in `QustionModel.swift`:

```swift
Question(
    image: "your_image_name",
    scramledLetters: [
        Letter(id: 0, text: "Y"),
        Letter(id: 1, text: "O"),
        Letter(id: 2, text: "U"),
        Letter(id: 3, text: "R"),
        // ... more letters
    ],
    correctAnswer: "YOUR_WORD"
)
```

### Adding New Images

1. Add your image to `Assets.xcassets`
2. Reference it by name in your Question model

## 📝 Code Highlights

- **SwiftUI Declarative UI**: Clean, readable interface code
- **State Management**: Proper use of `@State` for game state
- **Custom Views**: Reusable components for letters and game areas
- **Gesture Handling**: Intuitive tap gestures for letter selection
- **Animation**: Smooth transitions and visual feedback

## 🤝 Contributing

Feel free to contribute to this project by:
- Adding new word puzzles
- Improving the UI/UX
- Adding new features like difficulty levels
- Optimizing performance
- Adding sound effects

## 📄 License

This project is available for educational and personal use.

## 👨‍💻 Author

Created by Ajay Kumar

---

*Have fun playing and learning with ScrambledWords! 🎯*
