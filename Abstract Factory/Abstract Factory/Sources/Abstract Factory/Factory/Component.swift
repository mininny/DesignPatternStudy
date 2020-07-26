//
//  Coomponent.swift
//  
//
//  Created by Minhyuk Kim on 2020/07/26.
//

import Foundation

protocol Component: CustomStringConvertible {
    var name: String { get }
}

extension Component {
    func add(_ component: Component) { }
}

protocol Bun: Component {
    var type: String { get }
}

protocol Patty: Component {
    var cookedDegree: String { get }
    func cookTo(_ cookedDegree: CookedDegree)
}

protocol Sandwich: class {
    var components: [Component] { get set }
}

extension Sandwich {
    func add(_ component: Component) {
        self.components.append(component)
    }
    
    func package() -> String {
        return self.components
            .map { "< \($0.name) >" }
            .joined(separator: "\n")
    }
}
