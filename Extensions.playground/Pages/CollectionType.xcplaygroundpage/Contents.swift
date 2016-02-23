import Foundation

extension CollectionType {
    func shuffle() -> [Generator.Element] {
        var result: [Generator.Element] = []
        var index = startIndex
        repeat {
            if result.count == 0 {
                result.append(self[index])
            } else {
                let random = arc4random_uniform(UInt32(result.count + 1))
                result.insert(self[index], atIndex: Int(random))
            }
            index = index.successor()
        } while index != endIndex
        return result
    }
}


let arr = ["This", "is", "cool"]
arr.shuffle()

