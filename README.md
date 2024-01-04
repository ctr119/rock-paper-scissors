# Hola! 👋 👾 🎲

The classic game! ✊ ✋ ✌️

Great for practising your *rock-paper-scissors* abilities against a bot 🤖 💥

## Highlights

- Everything has been refactored to follow **Clean Architecture**. Starting from having everything into one single SwiftUI view.
- Animations! 🕺
  - Flip & Scale the Bot's move when it has been set
- Transitions
  - Pushing an element **in/out** (in `GameView`)
    - Transitioning directly on a `ZStack` does not always behave well when the removal happens 💥
    - Instead, embedding the transitioned view into a `VStack` fixes the issue ✅
  - Draw a rectangle around the `MoveButton`'s shape for letting the user know that it has been selected 👁️
- Centralising the **Designs** of the `Text`s using a *DesignSystem* approach
  - Defined styles:
    - Primary: `thin` & `regular`
    - Secondary: `regular`
    - Tertiary: `bold`
