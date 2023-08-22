//
//  HomeView.swift
//  test
//
//  Created by Irvan P. Saragi on 12/04/23.
//

import SwiftUI


struct HomeView: View {
    @State var HantuLompat : Bool = false
    @State var HantuHilang : Bool = false
    @State var HantuBesarKecil : CGFloat = 1.0
    @State var infoKuyang : Bool = false
    @State var infoTuyul : Bool = false
    @State var infoPocong : Bool = false
    @State var infoKuntilanak : Bool = false
    @State var infoGenderuwo : Bool = false
    @State var PlayButton : Bool = false
    @State var infoTutorial :Bool = false
    
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Button {
                        self.infoTutorial = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                    }
                    .sheet(isPresented: $infoTutorial){
                        InfoTutorialplayView()
                    }
                }
                Spacer()
                ZStack{
                    HStack{
                        NavigationLink(value: Destination.secondPage) {
                            HStack{
                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 60))
                                Text("Play")
                                    .font(.system(size: 50))
                                    .fontWeight(.bold)
                            }
                            .padding()
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                        }
                    }
                }
                Text("Before start the game, please read instruction ")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            Spacer()
            ScrollView(.horizontal){
                HStack(spacing: -130){
                    ButtonInfoHantuView(HantuLompat: $HantuLompat,
                                        HantuHilang: $HantuHilang,
                                        InfoHantuModal: $infoKuyang,
                                        GhostTiltle: GhostModel.kuyang.name,
                                        ghostInfo: .kuyang)
                    ButtonInfoHantuView(HantuLompat: $HantuLompat,
                                        HantuHilang: $HantuHilang,
                                        InfoHantuModal: $infoPocong,
                                        GhostTiltle: GhostModel.pocong.name,
                                        ghostInfo: .pocong)
                    ButtonInfoHantuView(HantuLompat: $HantuLompat,
                                        HantuHilang: $HantuHilang,
                                        InfoHantuModal: $infoTuyul,
                                        GhostTiltle: GhostModel.tuyul.name,
                                        ghostInfo: .tuyul)
                    ButtonInfoHantuView(HantuLompat: $HantuLompat,
                                        HantuHilang: $HantuHilang,
                                        InfoHantuModal: $infoKuntilanak,
                                        GhostTiltle: GhostModel.kuntilanak.name,
                                        ghostInfo: .kuntilanak)
                    ButtonInfoHantuView(HantuLompat: $HantuLompat,
                                        HantuHilang: $HantuHilang,
                                        InfoHantuModal: $infoGenderuwo,
                                        GhostTiltle: GhostModel.genderuwo.name,
                                        ghostInfo: .genderuwo)
                }
                .frame(height: 800)
            }
        }
        .animation(Animation.easeIn(duration: 2.5).repeatForever(), value: HantuLompat)
        .onAppear(){
            self.HantuLompat = true
            self.HantuHilang = true
        }
        .background(Image("treeFog")
            .resizable()
            .ignoresSafeArea()
        )
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


