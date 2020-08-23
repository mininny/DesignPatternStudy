//
//  FullBorder.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/23.
//

class FullBorder: Border {
    var display: Display
    var borderChar: Character
    
    init(display: Display, borderChar: Character) {
        self.display = display
        self.borderChar = borderChar
    }
    
    var columns: Int { self.display.columns + 2 }
    var rows: Int { self.display.rows + 2 }
    
    func text(for row: Int) -> String {
        switch row {
        case 1..<(self.rows - 1): return "\(borderChar)\(self.display.text(for: row - 1))\(borderChar)"
        default: return String(repeating: borderChar, count: self.columns)
        }
    }
}
