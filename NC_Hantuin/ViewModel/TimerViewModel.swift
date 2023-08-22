//
//  TimerViewModel.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 22/08/23.
//

import Foundation

struct TimerModel {
    var timerLimit: Int
    var timesUp: Bool
    
    mutating func decrementTimer() {
        if timerLimit > 0 {
            timerLimit -= 1
        } else {
            timesUp = true
        }
    }
}
