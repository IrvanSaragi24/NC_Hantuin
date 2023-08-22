//
//  LevelView.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct LevelView: View {
    @StateObject private var movePlayer = MovePlayer()
    var body: some View {
        
        ZStack{
            Color.gray
                .ignoresSafeArea()
            ButtonMovePlayerView(movePlayer: movePlayer)
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
