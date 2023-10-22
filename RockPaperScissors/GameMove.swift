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
}
