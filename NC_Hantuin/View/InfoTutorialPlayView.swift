//
//  TutorialPlayView.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct InfoTutorialplayView :View{
    var body: some View{
        VStack{
            VStack(alignment:.leading, spacing: 20){
                HStack(spacing: 30){
                    Image("Slider")
                        .resizable()
                        .frame(width: 200, height: 100)
                        .padding(.top, 20)
                    Text("slide the ghost icon to see other ghosts")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                }
                HStack{
                    ZStack{
                        Image("Brush")
                            .resizable()
                            .frame(width: 240, height: 80)
                        Text("Kuyang")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    Text("Click the ghost name for information about the ghost")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                    
                }
                HStack(spacing: 10){
                    HStack{
                        Image("Kuyang")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 160)
                            .padding(.leading, 20)
                        Image("boys")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160, height: 160)
                            .padding(.leading, -90)
                    }
                    Text("Catch the ghost by moving the character to the ghost")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                    
                }
                HStack(spacing: 50){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(color: .gray, radius: 50)
                            .frame(width: 70, height: 50)
                        Text("43")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    Text("Timer to catch ghosts")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                }
                .padding(.leading, 70)
                HStack(spacing: 50){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .shadow(color: .gray, radius: 50)
                            .frame(width: 180, height: 40)
                            .foregroundColor(.black)
                        Text("Find Ghost Call Kuyang")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    Text("quiz to complete the game")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                    
                }
                .padding(.leading, 10)
                HStack(spacing: 50){
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .scaledToFit()
                        .frame(width:50)
                    Text("Move player carachter to the forward")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                }
                .padding(.leading, 70)
                HStack(spacing: 50){
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .scaledToFit()
                        .frame(width:50)
                    Text("Move player carachter to the backward")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                    Spacer()
                }
                .padding(.leading, 70)
                HStack(spacing: 50){
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .scaledToFit()
                        .frame(width:50 )
                    Text("Move player carachter to the left")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                }
                .padding(.leading, 70)
                HStack(spacing: 50){
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .scaledToFit()
                        .frame(width: 50)
                        .frame(width:50 )
                    Text("Move player carachter to the right")
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                }
                .padding(.leading, 70)
            }
            
            .padding(.top, 60)
            .padding(.horizontal, 20)
            Spacer()
        }
        .background(Color("SoftGray"))
        
    }
}

