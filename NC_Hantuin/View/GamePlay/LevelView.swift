//
//  LevelView.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import SwiftUI

struct LevelView: View {
    @EnvironmentObject var router: Router
    
    var requireParam: Int = 0
    
    var body: some View {
        
        ZStack{
            Color.gray
                .ignoresSafeArea()
            VStack(spacing: 5){
                HStack{
                    Spacer()
                    Button {
                        router.popToRoot()
                    } label: {
                        Image(systemName: "xmark.square")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.black)
                            .padding(.horizontal, 30)
                            .padding(.top, 20)

                    }

                }
                Spacer()
                NavigationLink(value: Destination.thirdPage) {
                    ZStack{
                        Image("Brush")
                            .resizable()
                            .frame(width: 350, height: 150)
                        Text("Level 1")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                    }
                }
                NavigationLink(value: Destination.fourthPage) {
                    ZStack{
                        Image("Brush")
                            .resizable()
                            .frame(width: 350, height: 150)
                        Text("Level 2")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                    }
                }
                NavigationLink(value: Destination.fivePage) {
                    ZStack{
                        Image("Brush")
                            .resizable()
                            .frame(width: 350, height: 150)
                        Text("Level 3")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .font(.system(size: 40))
                    }
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray)
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
