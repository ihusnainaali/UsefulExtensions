import UIKit

enum ProjectColorsHex : UInt32 {
    case Color1 = 0xffffffcc
    case Color2 = 0x339666ff
    case Color3 = 0xff66ccff
    case Color4 = 0x33fe66ff
}

enum ProjectColorsString : String {
    case Color1 = "ffffffcc"
    case Color2 = "339666ff"
    case Color3 = "ff66ccff"
    case Color4 = "33fe66ff"
}

extension UIColor {
    // from hex enum
    convenience init(named name: ProjectColorsHex) {
        let rgba = name.rawValue.toRGBA
        self.init(red: rgba.red, green: rgba.green, blue: rgba.blue, alpha: rgba.alpha)
    }
    
    // from hex string exnum
    convenience init(named name: ProjectColorsString) {
        self.init(named: ProjectColorsHex(rawValue: name.rawValue.toUInt32)!)
    }
    
    // just from strings ^_^
    convenience init(named name: String) {
        let rgba = name.toUInt32.toRGBA
        self.init(red: rgba.red, green: rgba.green, blue: rgba.blue, alpha: rgba.alpha)
    }
}

extension ProjectColorsHex {
    var color : UIColor {
        return UIColor(named: self)
    }
}

extension ProjectColorsString {
    var color : UIColor {
        return UIColor(named: self)
    }
}

extension String {
    var toUInt32 : UInt32 { return UInt32(self, radix: 16)! }
}

extension UInt32 {
    var toRGBA : (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        get {
            let red   = CGFloat((self >> 24) & 0xff) / 255.0
            let green = CGFloat((self >> 16) & 0xff) / 255.0
            let blue  = CGFloat((self >>  8) & 0xff) / 255.0
            let alpha = CGFloat((self      ) & 0xff) / 255.0
            
            return (red, green, blue, alpha)
        }
    }
}

// hex enums
ProjectColorsHex.Color1.color
UIColor(named: ProjectColorsHex.Color4)

// string enums
ProjectColorsString.Color2.color
UIColor(named: ProjectColorsString.Color3)

// just strings
UIColor(named: "ffffffcc")








