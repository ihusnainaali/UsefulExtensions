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
}


"This is cool".reverse()


