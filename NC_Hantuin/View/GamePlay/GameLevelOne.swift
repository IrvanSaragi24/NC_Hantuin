import SwiftUI

struct GameLevelOne: View {
    @State private var timesUp = false
    @State private var isExploded = false
    @State var BackHome : Bool = false
    @State var timerLimit = 30
    @StateObject private var movePlayer = MovePlayer()
    private let explodingBits: Int = 75
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var questionLevel: Question = .level1
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        
        VStack{ // vstack keseluruhan
            
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .shadow(color: .gray, radius: 50)
                        .frame(width: 500, height: 40)
                        .foregroundColor(.black)
                    Text(questionLevel.questionLevel)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .shadow(color: .gray, radius: 50)
                        .frame(width: 70, height: 50)
                        .foregroundColor(.black)
                    Text("\(timerLimit)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .alert(isPresented: $timesUp){
                            Alert(title: Text("Times Up"), message: Text("Try Again"),primaryButton: .default(Text("Home")){
                                router.popToRoot()
                                timesUp = false
                            }, secondaryButton: .default(Text("Yes")){
                                timesUp = true
                                timerLimit = 30
                                movePlayer.offsetX = 200
                                movePlayer.offsetY = 300
                                movePlayer.offsetXPlayer = 650
                                movePlayer.offsetYPlayer = 850
                            })
                        }
                        .padding(.horizontal, 30)
                }
                
            }
            Spacer()
            ZStack{
                
                if movePlayer.catchGhost == true {
                    GameOverEffect(isExploded: isExploded)
                }
                
                VStack(alignment: .trailing) {
                    Image("Kuyang")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetX), y: CGFloat(movePlayer.offsetY))
                    Image("Pocong")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetXPocong), y: CGFloat(movePlayer.offsetYPocong))
                        .onAppear{//animasi perlu di jalankan atau tidak , selama player belum kalah
                            if movePlayer.catchGhost == false {
                                movePlayer.RandomMoveGhost()
                            }
                        }
                    
                        .alert(isPresented: $movePlayer.catchGhost) {
                            Alert(title: Text("Nice"),
                                  message: Text("you're right"),
                                  dismissButton: .default(Text("Next Level"))
                                  {
                                router.path.append(Destination.fourthPage)
                                timesUp = true
                            })
                        }
                }
                Image("\(movePlayer.NameImageChar)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .position(x: CGFloat(self.movePlayer.offsetXPlayer), y: CGFloat(self.movePlayer.offsetYPlayer))
                    .onTapGesture {
                        self.isExploded = true
                    }
            }
            HStack{
                Spacer()
                ButtonMovePlayerView(movePlayer: movePlayer)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(.gray)
        .onChange(of: movePlayer.offsetYPlayer){ _ in
            movePlayer.CatchGhost()
        }
        .onReceive(timer){
            _ in
            if timerLimit > 0{
                timerLimit -= 1
            }else{
                timesUp = true
            }
        }
    }
}


//struct GameLevelOne_Priviews: PreviewProvider {
//    static var previews: some View {
//        GameLevelOne()
//    }
//}


