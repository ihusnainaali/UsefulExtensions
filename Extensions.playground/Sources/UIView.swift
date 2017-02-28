import UIKit

extension UIView {
    func makeCornerRadiusHalfOfHeight() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    func makeCornerRadiusHalfOfWidth() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    static func recursiveInteraction(inView view: UIView, userInteraction: Bool, exeptViews views: [UIView] = []) {
        //        let types: [UIView.Type] = [UIButton.self, UIScrollView.self, UITextField.self, UIImageView.self]
        //        let type = type(of: view)
        //        let containts = types.contains { (t: UIView.Type) -> Bool in
        //            return t == type
        //        }
        
        if !views.contains(view) {
            let address = addressHeap(o: view)
            if userInteraction {
                view.isUserInteractionEnabled = memeoryDict[address] ?? userInteraction
                if let index = memeoryDict.index(forKey: address) {
                    memeoryDict.remove(at: index)
                }
            } else {
                memeoryDict[address] = view.isUserInteractionEnabled // ძველი დავქეშეთ
                view.isUserInteractionEnabled = userInteraction
            }
            
            // print("\t\(type(of: view)) \(addressHeap(o: view)) \(view.isUserInteractionEnabled) \(userInteraction)")
        }
        
        view.subviews.forEach {
            UIView.recursiveInteraction(inView: $0, userInteraction: userInteraction, exeptViews: views)
        }
    }
    
    static func enableUserInteraction(inSuperview superview: UIView?, rootView: UIView) {
        guard let view = superview, rootView != view else {
            return
        }
        view.isUserInteractionEnabled = true
        UIView.enableUserInteraction(inSuperview: view.superview, rootView: rootView)
        // print("\t\(type(of: view)) \(addressHeap(o: view)) \(view.isUserInteractionEnabled)")
    }
    
    static func listSubviewsOfView(view: UIView) {
        view.subviews.forEach {
            UIView.listSubviewsOfView(view: $0)
        }
    }
}

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

func addressHeap<T: Any>(o: T) -> Int {
    return unsafeBitCast(o, to: Int.self)
}

var memeoryDict = [Int: Bool]()


extension UIView {
    func addBlurEffect() {
        addSubview(createBlur())
    }
    
    func createBlur() -> UIView {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }
    
    func fullScreen(inView view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ])
    }
}








