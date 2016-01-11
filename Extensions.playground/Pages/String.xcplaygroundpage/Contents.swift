import Foundation

extension String {
    var lenght : Int { return self.characters.count }
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    func reverse() -> String {
        return (1...lenght)
            .map { "\(self[lenght - $0])" }
            .joinWithSeparator("")
    }
    
    static func randomString(size: Int) -> String {
        let source = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return (1...size)
            .map { (number) -> String in
                return "\(source[Int(arc4random_uniform(UInt32(source.lenght)))])"
            }
            .joinWithSeparator("")
    }
}

"This is cool".reverse()
String.randomString(10)






