//
//  multiOptionDialogAction.swift
//  alertDialog
//
//  Created by namik kaya on 14.04.2018.
//  Copyright © 2018 namik kaya. All rights reserved.
//

import UIKit

class multiOptionDialogAction: UIView {
    typealias completeHandler = () -> Void
    var completeHandlerHolder:completeHandler?
    
    var btn:multiOptionButton?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(rect:CGRect,
         title:String,
         bgColorNormal:UIColor=UIColor.white,
         bgColorHighlighted:UIColor = UIColor.gray,
         textColorNormal:UIColor = UIColor.blue,
         textColorHighlighted:UIColor = UIColor.black,
         corner:CGFloat = 5,
         borderWidth:CGFloat = 0,
         borderColorNormal:UIColor = UIColor.blue,
         borderColorHighligted:UIColor = UIColor.black,
         complete:@escaping completeHandler) {
        
        super.init(frame: rect)
        self.backgroundColor = UIColor.clear
        completeHandlerHolder = complete
        btn = multiOptionButton()
        btn?.normalBackgroundColor = bgColorNormal
        btn?.highlightedBackgroundColor = bgColorHighlighted
        btn?.normalTextColor = textColorNormal
        btn?.highlightedTextColor = textColorHighlighted
        btn?.cornerValue = corner
        btn?.borderColorNormal = borderColorNormal
        btn?.borderColorHighlighted = borderColorHighligted
        btn?.borderWidth = borderWidth
        
        btn?.id = generateRandomNumber(numDigits: 15)
        btn?.frame = CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height)
        btn?.setTitle(title, for: UIControlState.normal)
        self.addSubview(btn!)
        
        btn?.translatesAutoresizingMaskIntoConstraints = false
        
        btn?.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        btn?.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        btn?.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        btn?.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        btn?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        btn?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func generateRandomNumber(numDigits:Int)->Int{
        var place:Int = 1
        var finalNumber:Int = 0;
        
        for _ in 1...numDigits {
            place *= 10
            let randomNumber = Int(arc4random_uniform(10))
            finalNumber += randomNumber*place
        }

        return finalNumber
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func actionWithParam(sender: UIButton){
        //completeHandlerHolder!()
    }
    
}
