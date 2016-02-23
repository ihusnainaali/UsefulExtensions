import UIKit
import Foundation
import XCPlayground

enum ImageAsset: String {
    case Bat = "B.jpg"
    case Doom = "D.jpg"
    case Sup = "S.jpg"
    case Ww = "W.jpg"
}

extension ImageAsset {
    var image : UIImage {
        return UIImage(named: self.rawValue)!
    }
}

extension UIImage {
    convenience init(asset: ImageAsset) {
        self.init(named: asset.rawValue)!
    }
}

let enumAsImage = ImageAsset.Bat
enumAsImage.image
// do you bleed ^_^

let image = UIImage(asset: .Doom)
image
