import Foundation

enum GameMove: Int {
    case paper = 0
    case rock
    case scissors
    
    var string: String {
        switch self {
        case .paper:
            return "🧻"
        case .rock:
            return "🪨"
        case .scissors:
            return "✂️"
        }
    }
    
    func wins(_ move: GameMove) -> Bool? {
        switch (self, move) {
        case (.paper, .rock),
            (.rock, .scissors),
            (.scissors, .paper):
            return true
        
        case (.paper, .paper),
            (.rock, .rock),
            (.scissors, .scissors):
            return nil
            
        case (_, _):
            return false
        }
    }
}
