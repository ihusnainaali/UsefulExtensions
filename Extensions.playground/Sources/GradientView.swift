import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable
    var startColor: UIColor = UIColor.red {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable
    var endColor: UIColor = UIColor.purple {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable
    var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable
    var roundness: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    //    override class func layerClass() -> Any.Type {
    //        return CAGradientLayer.self
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    private func setupView(){
        
        let colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
    }
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
}

//let view = BWGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//
//view

