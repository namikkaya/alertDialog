//
//  bscButton.swift
//  lottoServiceTR
//
//  Created by namik kaya on 30.03.2018.
//  Copyright © 2018 namik kaya. All rights reserved.
//

import UIKit

/// Custom UIButton
class bscButton: UIButton {
    
    override var isHighlighted :Bool {
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                self.backgroundColor = highlightedBackgroundColor
            }
            else {
                self.backgroundColor = normalBackgroundColor
            }
            super.isHighlighted = newValue
        }
    }
    
    private var highlightedTextColorHolder:UIColor = UIColor.black
    /// Dokunulmuş An Text Rengi
    var highlightedTextColor :UIColor{
        set{
            highlightedTextColorHolder = newValue
            self.setTitleColor(highlightedTextColorHolder, for: UIControlState.highlighted)
        }get{
            return highlightedBackgroundColorHolder
        }
    }
    
    private var normalTextColorHolder:UIColor = UIColor.gray
    /// Normal Text Rengi
    var normalTextColor :UIColor {
        set{
            normalTextColorHolder = newValue
            self.setTitleColor(normalTextColor, for: UIControlState.normal)
        }get{
            return normalTextColorHolder
        }
    }

    private var highlightedBackgroundColorHolder:UIColor = UIColor.orange
    /// Dokunulduğu An Arka Plan rengi
    var highlightedBackgroundColor :UIColor {
        set{
            highlightedBackgroundColorHolder = newValue
        }get{
            return highlightedBackgroundColorHolder
        }
    }
    
    private var normalBackgroundColorHolder :UIColor = UIColor.blue
    /// Normal ArkaPlan Rengi
    var normalBackgroundColor:UIColor{
        set{
            normalBackgroundColorHolder = newValue
            self.backgroundColor = normalBackgroundColorHolder
        }get{
            return normalBackgroundColorHolder
        }
    }
    
    private var corner:CGFloat = 0
    /// Köşe Eğimi
    var cornerValue:CGFloat{
        set{
            corner = newValue
            self.layer.cornerRadius = newValue
        }get{
            return corner
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let inside:Bool = super.point(inside: point, with: event)
        if(inside && !self.isHighlighted && event?.type == UIEventType.touches){
            self.isHighlighted = true
        }
        return inside;
    }
    
    func setup(){
        self.backgroundColor = normalBackgroundColor
        self.contentEdgeInsets.bottom = 10
        self.contentEdgeInsets.top = 10
        self.contentEdgeInsets.left = 10
        self.contentEdgeInsets.right = 10
        //self.clipsToBounds = true
    }
    
}
