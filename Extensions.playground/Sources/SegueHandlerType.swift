import UIKit

protocol SegueHandlerType: class {
    associatedtype SeguaIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SeguaIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(segueIdentifier: SeguaIdentifier, sender: Any?) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }
    
    func identifier(for segue: UIStoryboardSegue) -> SeguaIdentifier {
        guard let id = segue.identifier, let segueIdentifier = SeguaIdentifier(rawValue: id) else {
            fatalError("Error")
        }
        
        return segueIdentifier
    }
}


