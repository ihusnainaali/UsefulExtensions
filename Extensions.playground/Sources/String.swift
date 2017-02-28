import Foundation
import UIKit

extension String {
    var lenght : Int { return self.characters.count }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    func reverse() -> String {
        return (1...lenght)
            .map { "\(self[lenght - $0])" }
            .joined(separator: "")
    }
    
    static func randomString(size: Int) -> String {
        let source = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return (1...size)
            .map { (number) -> String in
                return "\(source[Int(arc4random_uniform(UInt32(source.lenght)))])"
            }
            .joined(separator: "")
    }
    
    func frameSize(font: UIFont, constant: CGFloat, lineHeight: CGFloat = 1) -> CGRect {
        
        let paragraphStyle = NSMutableParagraphStyle()
        //        paragraphStyle.lineSpacing = 1.0
        paragraphStyle.lineHeightMultiple = lineHeight
        //        paragraphStyle.alignment = self.textAlignment
        
        let attrString = NSMutableAttributedString(string: self)
        attrString.addAttribute(NSFontAttributeName, value: font, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        
        let screenWidth = UIScreen.main.bounds.width
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth - constant, height: 0))
        label.attributedText = attrString
        label.numberOfLines = 0
        label.sizeToFit()
        return label.frame
    }
    
    func frameSize(font: UIFont, insets: UIEdgeInsets) -> CGRect {
        let button = UIButton()
        button.setTitle(self, for: .normal)
        button.titleLabel?.font = font
        button.contentEdgeInsets = insets
        button.sizeToFit()
        return button.frame
    }
    
    // ლარის სიმბოლო MyGeocell ფონტში
    static var gelSymbol: String {
        return "₾"
    }
    
    var count: Int {
        return characters.count
    }
    
    var isNumeric: Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let components = self.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        return self == filtered
    }
    
    var isBackSpace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
}
