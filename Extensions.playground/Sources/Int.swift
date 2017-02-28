import Foundation

extension Int {
    
    var isEven: Bool { return self % 2 == 0 }
    
    var isOdd: Bool { return !isEven }
    
    var isPositive: Bool { return self > 0 }
    
    var isNegative: Bool { return self < 0 }
    
    var toDouble: Double { return Double(self) }
    
    var toFloat: Float { return Float(self) }
    
    var digits: Int {
        if self == 0 {
            return 1
        }
        else if(Int(fabs(toDouble)) <= LONG_MAX) {
            return Int(log10(fabs(toDouble))) + 1
        }
        else {
            return -1;
        }
    }
    
    var isPrime: Bool {
        if self < 2  { return false }
        return (2..<self).filter { self % $0 == 0 }.count == 0
    }
    
    var random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
    
    static func random(from: Int, to: Int) -> Int {
        return Int(arc4random_uniform(UInt32(to - from + 1))) + from
    }
    
    static var randomUUID: Int {
        let first = "\(9.random + 1)"
        let middle = (0..<9).map { _ in "\(arc4random_uniform(10))" }
        let last = "\(9.random + 1)"
        let combined = [first] + middle + [last]
        return Int(combined.joined(separator: "")) ?? -1
    }
}
