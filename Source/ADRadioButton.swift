//
//  RadioButton.swift
//  All_Utilities
//
//  Created by Hexagon on 15/02/21.
//

import UIKit
@IBDesignable
public class ADRadioButton: UIControl {
    private let imageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    @IBInspectable
    public var isChecked: Bool = false {
        didSet{
            self.imageView.image = isChecked ? selectedImage?.withRenderingMode(.alwaysTemplate) : image?.withRenderingMode(.alwaysTemplate)
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    public var image: UIImage?{
        didSet{
            imageView.image = image?.withRenderingMode(.alwaysTemplate)
            self.updateImageSize()
        }
    }
    @IBInspectable public var selectedImage: UIImage?
    
    @IBInspectable
    public var imageColor: UIColor? = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1){
        didSet{
            imageView.tintColor = imageColor
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.commonInit()
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    private func commonInit() {
        addTarget(self, action:#selector(handleTap(_:)), for: UIControl.Event.touchUpInside)
        self.imageView.center = self.center
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        self.updateImageSize()
    }
    
    fileprivate func updateImageSize(){
        NSLayoutConstraint.activate([
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        self.setNeedsLayout()
        self.setNeedsDisplay()
    }
    @objc private func handleTap(_ sender: Any) {
        isChecked = !isChecked
        sendActions(for: .valueChanged)
    }
}

