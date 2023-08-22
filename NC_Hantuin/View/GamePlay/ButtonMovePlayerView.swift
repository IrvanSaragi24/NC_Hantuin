//
//  ButtonMovePlayerView.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct ButtonMovePlayerView: View {
    @ObservedObject var movePlayer: MovePlayer
    var body: some View {
        VStack {
            Button {
                movePlayer.btnatas = true
                movePlayer.movePlayer()
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
            }
            HStack {
                Button {
                    movePlayer.btnkiri = true
                    movePlayer.movePlayer()
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                }
                .padding(.horizontal, 20)
                Button {
                    movePlayer.btnkanan = true
                    movePlayer.movePlayer()
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                }
                .padding(.horizontal, 20)
            }
            Button(action: {
                movePlayer.btnbawah = true
                movePlayer.movePlayer()
            }, label: {
                Image(systemName: "arrow.down.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
            })
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 50)
    }
}
