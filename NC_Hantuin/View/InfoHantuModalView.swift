//
//  InfoHantuModalView.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct InfoHantu: View {
    let ghostInfo: GhostModel
    
    var body: some View {
        VStack(alignment: .center) {
            Image(ghostInfo.imageName)
                .resizable()
                .frame(width: 200, height: 300)
            
            Text(ghostInfo.name)
                .font(.system(size: 40))
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 10)
                .foregroundColor(.black)
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .shadow(color: .gray, radius: 50)
                        .frame(width: 500, height: 40)
                        .foregroundColor(.black)
                    
                    Text("Origin Place: \(ghostInfo.originPlace)")
                        .font(.system(size: 25))
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 10)
            }
            
            Text("Story: \(ghostInfo.story)")
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .lineSpacing(5)
                .foregroundColor(.black)
                .font(.body)
        }
        .padding(.horizontal, 60)
        .background(Image("ModalBackground"))
    }
}
