import UIKit

extension UIBarButtonItem {
    static var empty: UIBarButtonItem {
        return UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
