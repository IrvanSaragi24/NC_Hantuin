//
//  ButtonViewModel.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import Foundation
import SwiftUI

class MovePlayer : ObservableObject{
    
    @Published var offsetY: Int = 300 // posisi awal secara vertikal kuyang
    @Published var offsetX: Int = 200 // posisi awal secara horizontal kuyang
    @Published var offsetXPocong: Int = 300
    @Published var offsetYPocong: Int = 200
    @Published var offsetYPlayer = 850 //posisi awal vertikal player
    @Published var offsetXPlayer = 650 //posisi awal horizontal
    @Published var offsetXKunti: Int = 300
    @Published var offsetYKunti: Int = 200
    @Published var offsetXGende: Int = 400
    @Published var offsetYGende: Int = 400
    @Published var offsetXTuyul: Int = 100
    @Published var offsetYTuyul: Int = 100
    @Published var btnatas = false // btn atas kondisi awal
    @Published var btnbawah = false //btn bawah kondisi awal
    @Published var btnkiri = false // btn kiri kondisi awal
    @Published var btnkanan = false //btn kanan kondisi awal
    @Published var catchGhost = false //define player masih bermain atau tidak
    @Published var timesUp = false
    @Published var NameImageChar = "boys"
    
    let ghostImageNames = ["Genderuwo", "Pocong", "Kuntilanak", "Tuyul", "Kuyang"]
    
    func movePlayer(){
        if btnatas {
            offsetYPlayer -= 20
            CatchGhost()
            btnatas.toggle()
        }
        else if btnbawah {
            offsetYPlayer += 20
            CatchGhost()
            btnbawah.toggle()
        }
        else if btnkiri {
            offsetXPlayer -= 20
            CatchGhost()
            btnkiri.toggle()
        }
        else if btnkanan {
            offsetXPlayer += 20
            CatchGhost()
            btnkanan.toggle()
        }
        
    }
    
    func CatchGhost(){
        if abs(self.offsetX - self.offsetXPlayer) < 100 && abs(self.offsetY - self.offsetYPlayer) < 100{// abs = mengambil radius angka sebuah nilai location flaot
            self.catchGhost = true
        }else{
            self.catchGhost = false
        }
    }
    
    func RandomMoveGhost() {
        withAnimation {
            if catchGhost == false{
                offsetX = Int.random(in: 1...500)
                offsetXPocong = Int.random(in: 1...500)
                offsetXGende = Int.random(in: 1...500)
                offsetXKunti = Int.random(in: 1...500)
                offsetXTuyul = Int.random(in: 1...500)
                
            }
           // bawah
            offsetY = Int.random(in: 1...800)
            offsetYPocong = Int.random(in: 1...800)
            offsetYGende = Int.random(in: 1...800)
            offsetYKunti = Int.random(in: 1...800)
            offsetYKunti = Int.random(in: 1...800)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {//memberikan sebuah kecepatan kuayng
            withAnimation {
                if self.catchGhost == false{
                    self.offsetX = Int.random(in: 1...800)
                    self.offsetXPocong = Int.random(in: 1...800)
                    self.offsetXGende = Int.random(in: 1...800)
                    self.offsetXKunti = Int.random(in: 1...800)
                    self.offsetXTuyul = Int.random(in: 1...800)
                }
               //bawah
                self.offsetY = Int.random(in: 1...600)// up
                self.offsetYPocong = Int.random(in: 1...800)
                self.offsetYGende = Int.random(in: 1...800)
                self.offsetYKunti = Int.random(in: 1...800)
                self.offsetYTuyul = Int.random(in: 1...800)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.RandomMoveGhost()
            }
        }
    }
    
    
}
