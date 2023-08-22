//
//  HomeView.swift
//  test
//
//  Created by Irvan P. Saragi on 12/04/23.
//

import SwiftUI

struct HomeView: View {
    @State var hantuLompat: Bool = false
    @State var hantuHilang: Bool = false
    @State var infoKuyang: Bool = false
    @State var infoTuyul: Bool = false
    @State var infoPocong: Bool = false
    @State var infoKuntilanak: Bool = false
    @State var infoGenderuwo: Bool = false
    @State var infoTutorial: Bool = false
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        self.infoTutorial = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                    }
                    .sheet(isPresented: $infoTutorial) {
                        InfoTutorialplayView()
                    }
                }
                Spacer()
                ZStack {
                    HStack {
                        NavigationLink(value: Destination.secondPage) {
                            HStack {
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
            ScrollView(.horizontal) {
                HStack(spacing: -130) {
                    ButtonInfoHantuView(hantuLompat: $hantuLompat,
                                        hantuHilang: $hantuHilang,
                                        infoHantuModal: $infoKuyang,
                                        ghostTiltle: GhostModel.kuyang.name,
                                        ghostInfo: .kuyang)
                    ButtonInfoHantuView(hantuLompat: $hantuLompat,
                                        hantuHilang: $hantuHilang,
                                        infoHantuModal: $infoPocong,
                                        ghostTiltle: GhostModel.pocong.name,
                                        ghostInfo: .pocong)
                    ButtonInfoHantuView(hantuLompat: $hantuLompat,
                                        hantuHilang: $hantuHilang,
                                        infoHantuModal: $infoTuyul,
                                        ghostTiltle: GhostModel.tuyul.name,
                                        ghostInfo: .tuyul)
                    ButtonInfoHantuView(hantuLompat: $hantuLompat,
                                        hantuHilang: $hantuHilang,
                                        infoHantuModal: $infoKuntilanak,
                                        ghostTiltle: GhostModel.kuntilanak.name,
                                        ghostInfo: .kuntilanak)
                    ButtonInfoHantuView(hantuLompat: $hantuLompat,
                                        hantuHilang: $hantuHilang,
                                        infoHantuModal: $infoGenderuwo,
                                        ghostTiltle: GhostModel.genderuwo.name,
                                        ghostInfo: .genderuwo)
                }
                .frame(height: 800)
            }
        }
        .animation(Animation.easeIn(duration: 2.5).repeatForever(), value: hantuLompat)
        .onAppear() {
            self.hantuLompat = true
            self.hantuHilang = true
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
