//
//  QuestionModel.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 21/08/23.
//

import Foundation

enum Question {
    case level1, level2, level3
    
    var questionLevel: String {
        switch self {
        case .level1: return "Find Ghost Call Kuyang"
        case .level2: return "Find Ghost Call Pocong"
        case .level3: return "Find Ghost Come From Yogyakarta"
        }
    }
    
    var timerLimit: Int {
        switch self {
        case .level1: return 30
        case .level2: return 40
        case .level3: return 50
        }
    }
}

