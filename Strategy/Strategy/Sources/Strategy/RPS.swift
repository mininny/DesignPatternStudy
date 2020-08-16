//
//  RPS.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/16.
//


enum RPS {
    case rock, paper, scissors
    
    func wins(_ opponent: RPS) -> Bool {
        switch self {
        case .rock: return opponent == .scissors
        case .paper: return opponent == .rock
        case .scissors: return opponent == .paper
        }
    }
    
    static var random: RPS {
        let rand = Int.random(in: 0..<3)
        switch rand {
        case 0: return .rock
        case 1: return .paper
        default: return .scissors
        }
    }
}
