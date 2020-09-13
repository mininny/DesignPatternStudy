import UIKit

class Factory {
    static let shared = Factory()
    
    var renderItems: [String: UIImage?] = [:]
    func getImage(for renderItem: RenderItem) -> UIImage? {
        if let image = self.renderItems[renderItem.rawValue] {
            return image
        }
        
        let image = UIImage(named: renderItem.rawValue)
        self.renderItems[renderItem.rawValue] = image
        return image
    }
}

enum RenderItem: RawRepresentable {
    typealias RawValue = String
    
    case tree(height: Int64)
    case car(type: String)
    case road(length: Int64)
    case building(size: CGSize)
    
    init?(rawValue: String) {
        return nil
    }
    
    var rawValue: String {
        switch self {
        case .tree(let height): return "tree_\(height).png"
        case .car(let type): return "car_\(type).png"
        case .road(let length): return "road_\(length).png"
        case .building(let size): return "building_\(size.width)_\(size.height).png"
        }
    }
}

class MapRenderer {
    var renderItems: [UIImage?] = []
    func render(count: Int) {
        let factory = Factory.shared
        
        for _ in 0..<count {
            renderItems.append(factory.getImage(for: .tree(height: 1)))
            renderItems.append(factory.getImage(for: .car(type: "Tesla")))
            renderItems.append(factory.getImage(for: .road(length: 5)))
            renderItems.append(factory.getImage(for: .building(size: CGSize(width: 30, height: 30))))
        }
    }
}
