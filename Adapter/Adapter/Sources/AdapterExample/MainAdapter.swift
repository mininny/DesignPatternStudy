class MainAdapter<T>: MainInterface {
    typealias ItemType = T
    
    let mathExecutor = MathExecutor()
    let stringExecutor = StringExecutor()
    let boolExecutor = BoolExecutor()
    
    func add(_ item1: T, _ item2: T) -> T? {
        switch (item1, item2) {
        case let (int1, int2) as (Int, Int):
            return self.mathExecutor.add(int1, int2) as? T
        case let (str1, str2) as (String, String):
            return self.stringExecutor.add(str1, str2) as? T
        case let (bool1, bool2) as (Bool, Bool):
            return self.boolExecutor.add(bool1, bool2) as? T
        default: break
        }
        
        return nil
    }
}
