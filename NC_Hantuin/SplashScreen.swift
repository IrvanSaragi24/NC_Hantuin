//
//  SplasScreen.swift
//  Hantuin
//
//  Created by Irvan P. Saragi on 14/04/23.
//

import SwiftUI

struct SplashScreen: View {
    @State var splashicon :Bool = false
    var body: some View {
        ZStack{
            if self.splashicon{
                HomeView()
            }
            else{
                Image("Komik")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(40)
                    .shadow(radius: 40)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                withAnimation{
                    
                    self.splashicon = true
                }
                
            }
            
        }
        
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
