//
//  GameLevelThree.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct GameLevelThree: View {
    @State private var timesUp = false
    @State private var isExploded = false
    @State var BackHome : Bool = false
    @State var timerLimit = 30
    @StateObject private var movePlayer = MovePlayer()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var questionLevel: Question = .level3
    
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
                            Alert(title: Text("Times Up"), message: Text("Try Again"),primaryButton: .default(Text("Home")){
                                print("BackHome")
                            }, secondaryButton: .default(Text("Yes")){
                                timesUp = false
                                timerLimit = 50
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
                
                VStack() {
                    Image("Genderuwo")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetX), y: CGFloat(movePlayer.offsetY))
                    Image("Pocong")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetXPocong), y: CGFloat(movePlayer.offsetYPocong))
                    Image("Kuntilanak")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetXKunti), y: CGFloat(movePlayer.offsetYKunti))
                    Image("Tuyul")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetXTuyul), y: CGFloat(movePlayer.offsetYTuyul))
                    Image("Kuyang")
                        .resizable()
                        .frame(width: 100, height: 125)
                        .opacity(movePlayer.catchGhost == true ? 0 : 1)
                        .position(x: CGFloat(movePlayer.offsetXGende), y: CGFloat(movePlayer.offsetYGende))
                }
                .onAppear{
                    if movePlayer.catchGhost == false {
                        movePlayer.RandomMoveGhost()
                    }
                }
                .alert(isPresented: $movePlayer.catchGhost) {
                    Alert(title: Text("End Game!!!"),
                          message: Text("Nice Catch"),
                          dismissButton: .default(Text("Home"))
                          {
                        print("BackHome")
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
        .background(.gray)
        .onChange(of: movePlayer.offsetYPlayer){ _ in
            movePlayer.CatchGhost()
        }
        .onReceive(timer){ _ in
            if timerLimit > 0{
                timerLimit -= 1
            }else{
                timesUp = true
            }
        }
    }
}
struct GameLevelThree_Previews: PreviewProvider {
    static var previews: some View {
        GameLevelThree()
    }
}
