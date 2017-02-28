import UIKit

extension UINavigationBar {
    func setShadowImage(withColor color: UIColor = UIColor.red) {
        shadowImage = UIImage.image(
            withColor: color,
            inRect: CGRect(x: 0, y: 0, width: 1, height: 0.5))
    }
    
    func setBackgroundImage(withColor color: UIColor = UIColor.white) {
        let image = UIImage.image(
            withColor: color,
            inRect: CGRect(x: 0, y: 0, width: frame.width, height: 64))
        setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    func defaultBar(withShadowColor color: UIColor = UIColor.white) {
        barTintColor = UIColor.red
        tintColor = UIColor.red
        
//        titleTextAttributes = [
//            NSForegroundColorAttributeName: UIColor.red,
//            NSFontAttributeName: UIFont(name: ProjectFont.base.rawValue, size: 15)!
//        ]
        
        isTranslucent = false
        
        setShadowImage(withColor: color)
        setBackgroundImage(withColor: UIColor.white)
    }
}
