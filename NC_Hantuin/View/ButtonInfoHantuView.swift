//
//  ButtonView.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct ButtonInfoHantuView: View {
    @Binding var hantuLompat: Bool
    @Binding var hantuHilang: Bool
    @Binding var infoHantuModal: Bool
    @State var ghostTiltle: String
    @State var ghostInfo: GhostModel
    var body: some View {
        ZStack(alignment: .center) {
            Image("\(ghostInfo.name)")
                .resizable()
                .frame(width: 120, height: 200)
                .padding(.bottom, 250)
                .offset(y: hantuLompat ? -50:0)
                .opacity(hantuHilang ? 1:0)
            Image("standingGray")
            Button(action: {
                self.infoHantuModal = true
            }, label: {
                ZStack {
                    Image("Brush")
                        .resizable()
                        .frame(width: 240, height: 80)
                    Text("\(ghostInfo.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            })
            .padding(.top, 170)
            .sheet(isPresented: $infoHantuModal) {
                InfoHantu(ghostInfo: ghostInfo)
            }
        }
    }
}
