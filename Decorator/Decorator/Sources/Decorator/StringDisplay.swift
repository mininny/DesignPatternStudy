//
//  StringDisplay.swift
//  
//
//  Created by Minhyuk Kim on 2020/08/23.
//

class StringDisplay: Display {
    var columns: Int { texts.map({ $0.count }).max() ?? 0 }
    var rows: Int { self.texts.count }
    var texts: [String]
    
    init(text: String) {
        self.texts = text.split(separator: "\n").map { String($0) }
    }
    
    func text(for row: Int) -> String {
        return texts[row]
    }
}
