import Foundation

extension Double {
    func round(decimals: Int) -> Double
    {
        let format : NSNumberFormatter = NSNumberFormatter()
        format.numberStyle = NSNumberFormatterStyle.DecimalStyle
        format.roundingMode = NSNumberFormatterRoundingMode.RoundHalfUp
        format.maximumFractionDigits = decimals
        let string: NSString = format.stringFromNumber(NSNumber(double: self))!
        return string.doubleValue
    }
}

30.444.round(2)

