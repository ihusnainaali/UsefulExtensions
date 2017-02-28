import UIKit

enum ImageAsset: String {
    case someImage = "airplane"
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
    
    static func image(withColor color: UIColor, inRect rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

public extension UIImage {
    func imageWithAlpha(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: 0.5)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    convenience init(view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 1)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)
    }
}

