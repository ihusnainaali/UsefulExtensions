import UIKit

enum ProjectStoryboard: String {
    case someStoryboard = "name"
}

extension UIStoryboard {
    convenience init(name: ProjectStoryboard, bundle: Bundle?) {
        self.init(name: name.rawValue, bundle: bundle)
    }
}
