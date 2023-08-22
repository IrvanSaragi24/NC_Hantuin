//
//  GameOverEffect.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI
//#-learning-task(explodingAnimation)

/*#-code-walkthrough(0.explodingAnimation)*/
struct GameOverEffect: View {
    /*#-code-walkthrough(0.explodingAnimation)*/
    /*#-code-walkthrough(1.explodingAnimation)*/
    @State var isExploded: Bool = false
    @State var losePlayerCheck: Bool = false
    /*#-code-walkthrough(1.explodingAnimation)*/
    private let explodingBits: Int = 75
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                /*#-code-walkthrough(3a.explodingAnimation)*/
                ForEach(0..<explodingBits, id: \.self) { _ in
                    /*#-code-walkthrough(3a.explodingAnimation)*/
                    Rectangle()
                        .rotation(Angle(degrees: Double.random(in: 0..<360)))
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                    /*#-code-walkthrough(3b.explodingAnimation)*/
                        .offset(x: isExploded ? (Double.random(in: -1...1) * 500) : 0, y: isExploded ? (Double.random(in: -1...1) * 500) : 0)
                    /*#-code-walkthrough(3b.explodingAnimation)*/
                    /*#-code-walkthrough(4.explodingAnimation)*/
                        .opacity(isExploded ? 0 : 1)
                        .animation(.easeInOut.speed(0.6), value: isExploded)
                    /*#-code-walkthrough(4.explodingAnimation)*/
                        .padding()
                }
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.gray)
                /*#-code-walkthrough(2.explodingAnimation)*/
                    .opacity(isExploded ? 0 : 1)
                    .animation(.easeInOut.speed(0.6), value: isExploded)
                /*#-code-walkthrough(2.explodingAnimation)*/
                    .padding()
            }
            Spacer()
                .onAppear{
                    isExploded.toggle()
                }
        }
        .navigationBarTitleDisplayMode(.inline)
       
    }
}


