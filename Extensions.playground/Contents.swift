import UIKit

extension Int {
    var isEven: Bool { return self % 2 == 0 }
    
    var isOdd: Bool { return !isEven }
    
    var isPositive: Bool { return self > 0 }
    
    var isNegative: Bool { return self < 0 }
    
    var toDouble: Double { return Double(self) }
    
    var toFloat: Float { return Float(self) }
    
    var digits: Int {
        if self == 0
        {
            return 1
        }
        else if(Int(fabs(toDouble)) <= LONG_MAX)
        {
            return Int(log10(fabs(toDouble))) + 1
        }
        else
        {
            return -1;
        }
    }
    
    var isPrime: Bool {
        if self < 2  { return false }
        return (2..<self).filter { self % $0 == 0 }.count == 0
    }
}

2.isPrime
3.isPrime
105.isPrime



