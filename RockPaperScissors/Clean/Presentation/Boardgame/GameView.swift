import SwiftUI

struct GameView: View {    
    // Background animation
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    private let colors = [Color(#colorLiteral(red: 0.9843137255, green: 0.9176470588, blue: 0.6470588235, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.3333333333, blue: 0.6117647059, alpha: 1)), Color(#colorLiteral(red: 0.4156862745, green: 0.7098039216, blue: 0.9294117647, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.1137254902, blue: 0.7490196078, alpha: 1)), Color(#colorLiteral(red: 0.337254902, green: 0.9215686275, blue: 0.8509803922, alpha: 1))]
        
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            animatedBackground
                .blur(radius: 80)
            
            VStack {
                Spacer()
                
                BotBoardView(viewModel: viewModel)
                    .boardStyle()
                
                Spacer()
                Spacer()
                
                PlayerBoardView(viewModel: viewModel)
                    .boardStyle()
                
                Spacer()
                
                Text("Round \(viewModel.roundsIndex) of \(GameViewModel.maxRounds)")
                    .font(.footnote.monospaced())
            }
            .padding()
        }
        .gameOver(alert: .init(title: "Finish!", message: viewModel.gameOverMessage),
                  when: $viewModel.isGameOver,
                  action: viewModel.restart)
    }
    
    private var animatedBackground: some View {
        LinearGradient(gradient: Gradient(colors: colors),
                       startPoint: start,
                       endPoint: end)
        .edgesIgnoringSafeArea(.all)
        .animation(
            .easeInOut(duration: 10)
            .repeatForever(autoreverses: true)
            .speed(0.5),
            value: start
        )
        .onReceive(timer) { _ in
            self.start = UnitPoint(x: 4, y: 0)
            self.end = UnitPoint(x: 0, y: 2)
            self.start = UnitPoint(x: -4, y: 20)
            self.start = UnitPoint(x: 4, y: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
