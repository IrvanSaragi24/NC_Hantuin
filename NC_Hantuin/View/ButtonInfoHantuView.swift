//
//  ButtonView.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct ButtonInfoHantuView: View {
    @Binding var HantuLompat : Bool
    @Binding var HantuHilang : Bool
    @Binding var InfoHantuModal : Bool
    @State var GhostTiltle : String
    @State var ghostInfo: GhostModel
    
    var body: some View {
        ZStack(alignment: .center){
            Image("\(ghostInfo.name)")
                .resizable()
                .frame(width: 120, height: 200)
                .padding(.bottom, 250)
                .offset(y: HantuLompat ? -50:0)
                .opacity(HantuHilang ? 1:0)
            Image("standingGray")
            Button(action: {
                self.InfoHantuModal = true
            }, label: {
                ZStack{
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
            .sheet(isPresented: $InfoHantuModal){
                InfoHantu (ghostInfo: ghostInfo)
            }
            
        }
    }
}
