import UIKit
import Foundation

enum ImageAsset: String {
    case Apple = "apple"
    case Microsoft = "microsoft"
    case Google = "google"
    case Youtube = "youtube"
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

//let enumAsImage = ImageAsset.Apple
//enumAsImage.image

//let image = UIImage(asset: .Microsoft) // boo
