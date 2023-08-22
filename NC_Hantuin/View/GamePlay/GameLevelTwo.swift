//
//  GameLevelTwo.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct GameLevelTwo: View {
    @State private var timesUp = false
    @State private var isExploded = false
    @State var BackHome : Bool = false
    @State var timerLimit = 35
    @StateObject private var movePlayer = MovePlayer()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var questionLevel: Question = .level2
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        
        VStack{
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
                            Alert(title: Text("Times Up"), message: Text("Try Again"),primaryButton: .default(Text("Yes")){
                                timesUp = false
                                timerLimit = 35
                                movePlayer.offsetX = 200
                                movePlayer.offsetY = 300
                                movePlayer.offsetXPlayer = 650
                                movePlayer.offsetYPlayer = 850
                                
                            }, secondaryButton: .default(Text("Home")){
                                router.popToRoot()
                                timesUp = true
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
                
                VStack() {
                    Image("Pocong")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetX), y: CGFloat(movePlayer.offsetY))
                    Image("Kuyang")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetXPocong), y: CGFloat(movePlayer.offsetYPocong))
                    Image("Kuntilanak")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetXKunti), y: CGFloat(movePlayer.offsetYKunti))
                       
                    
                        
                }
                .onAppear{
                    if movePlayer.catchGhost == false {
                        movePlayer.RandomMoveGhost()
                    }
                }
                .alert(isPresented: $movePlayer.catchGhost) {
                    Alert(title: Text("Nice"),
                          message: Text("you're right"),
                          dismissButton: .default(Text("Next Level"))
                          {
                        router.path.append(Destination.fivePage)
                        timesUp = true
                    })
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


//struct GameLevelTwo_Priviews: PreviewProvider {
//    static var previews: some View {
//        GameLevelTwo()
//    }
//}



