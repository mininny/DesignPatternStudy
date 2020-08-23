//
//  CornerBorder.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/23.
//

class CornerBorder: Border {
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
        case 1..<(self.rows - 1): return " \(self.display.text(for: row - 1)) "
        default: return "\(borderChar)\(String(repeating: " ", count: self.columns - 2))\(borderChar)"
        }
    }
}
