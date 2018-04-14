//
//  multiOptionDialog.swift
//  alertDialog
//
//  Created by namik kaya on 14.04.2018.
//  Copyright © 2018 namik kaya. All rights reserved.
//

import UIKit

class multiOptionDialog: UIViewController, UIGestureRecognizerDelegate {
    
    var btn:multiOptionDialog?
    var dict:[Int:multiOptionDialogAction.completeHandler] = [:]
    
    private var dialogView: UIView = {
        let newView = UIView()
        newView.frame = CGRect(x: 0, y: 0, width: 360, height: 200)
        newView.backgroundColor = UIColor.white
        newView.layer.cornerRadius = 8
        return newView
    }()
    
    private var titleText:UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.numberOfLines = 2
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    private var commentText:UILabel = {
        let label = UILabel()
        label.text = "..."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 6
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    //-------------------
    
    /// Dialog window corner Radius
    var dialogCorner:CGFloat = 0 {
        didSet{
            dialogView.layer.cornerRadius = dialogCorner
        }
    }
    
    /// Dialog window backgroundColor
    var dialogBackgroundColor:UIColor = UIColor.white {
        didSet{
            dialogView.backgroundColor = dialogBackgroundColor
        }
    }
    
    /// Dialog Window Title Text
    var dialogTitle:String = "Başlık"{
        didSet{
            titleText.text = dialogTitle
        }
    }
    
    /// Dialog Window Title Text Color
    var dialogTitleColor:UIColor = UIColor.black {
        didSet{
            titleText.textColor = dialogTitleColor
        }
    }
    
    
    /// Dialog Window Comment Text
    var dialogComment:String = "Açıklama" {
        didSet{
            commentText.text = dialogComment
        }
    }
    
    /// Dialog Window Comment Text Color
    var dialogCommentColor:UIColor = UIColor.black {
        didSet{
            commentText.textColor = dialogCommentColor
        }
    }
    
    //--------------------------------------------------
    
    
    /// background click close 
    var backgroundClickable:Bool = true
    
    var buttonArry:[multiOptionDialogAction] = []
    var butRect:Int = 0
    func addButton(button:multiOptionDialogAction){
        button.btn?.addTarget(self, action: #selector(multiOptionDialog.optionButtonAction(sender:)), for: .touchUpInside)
        dict[(button.btn?.id)!] = button.completeHandlerHolder
        
        buttonArry.append(button)
        
        if(butRect == 1){
            button.frame.origin.y += 100
        }
        
        dialogView.addSubview(button)
        butRect += 1
    }
    
    @objc func optionButtonAction(sender: UIButton){
        let btn = sender as! multiOptionButton
        for (key, value) in dict {
            if btn.id == key{
                completeHandlerHolder = value
                UIView.animate(withDuration: 0.1, animations: {
                    self.dialogView.frame.origin.y += 20
                    self.dialogView.alpha = 0
                }) { (true) in
                    self.close()
                }
            }
        }
    }
    
    private var completeHandlerHolder:multiOptionDialogAction.completeHandler!
    private func close(){
        self.dismiss(animated: true) {
            self.completeHandlerHolder()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0) {
            self.dialogView.alpha = 0.0
            self.dialogView.frame.origin.y += 20
            
        }
        
        UIView.animate(withDuration: 0.2) {
            self.dialogView.alpha = 1
            self.dialogView.frame.origin.y -= 20
            self.dialogView.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if backgroundClickable {
            let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.backgroundClick (_:)))
            self.view.addGestureRecognizer(gesture)
            gesture.delegate = self
        }
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(dialogView)
        dialogView.addSubview(titleText)
        dialogView.addSubview(commentText)
        
        self.dialogView.translatesAutoresizingMaskIntoConstraints = false
        self.titleText.translatesAutoresizingMaskIntoConstraints = false
        self.commentText.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
        
        UIView.animate(withDuration: 0) {
            self.dialogView.alpha = 0.0
            self.dialogView.frame.origin.y += 20
            
        }
    }
    
    func setupLayout(){
        dialogView.widthAnchor.constraint(equalToConstant: 360).isActive = true
        dialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dialogView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
        
        titleText.topAnchor.constraint(equalTo: dialogView.topAnchor, constant: 16).isActive = true
        titleText.widthAnchor.constraint(equalTo: dialogView.widthAnchor).isActive = true
        titleText.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
        
        commentText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 8).isActive = true
        commentText.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
        commentText.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 16).isActive = true
        
        for (index, item) in buttonArry.enumerated() {
            item.translatesAutoresizingMaskIntoConstraints = false
            if (index == 0){
                item.topAnchor.constraint(equalTo: commentText.bottomAnchor, constant: 32).isActive = true
                item.widthAnchor.constraint(equalTo: dialogView.widthAnchor, constant: -32).isActive = true
                item.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor, constant: 0).isActive = true
            }else {
                item.topAnchor.constraint(equalTo: buttonArry[index-1].bottomAnchor, constant: 8).isActive = true
                item.widthAnchor.constraint(equalTo: buttonArry[index-1].widthAnchor, constant: 0).isActive = true
                item.centerXAnchor.constraint(equalTo: buttonArry[index-1].centerXAnchor, constant: 0).isActive = true
            }
            
        }
        if (buttonArry.count > 1) {
            dialogView.bottomAnchor.constraint(equalTo: buttonArry[buttonArry.count-1].bottomAnchor, constant: 16).isActive = true
        }else if (buttonArry.count == 1){
            dialogView.bottomAnchor.constraint(equalTo: buttonArry[0].bottomAnchor, constant: 16).isActive = true
        }else if( buttonArry.count == 0){
            dialogView.bottomAnchor.constraint(equalTo: commentText.bottomAnchor, constant: 16).isActive = true
        }
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        var shouldReceive = false
        if let clickedView = touch.view {
            if clickedView == self.view {
                shouldReceive = true;
            }
        }
        return shouldReceive
    }
    
    @objc func backgroundClick(_ sender:UITapGestureRecognizer){
        UIView.animate(withDuration: 0.1, animations: {
            self.dialogView.frame.origin.y += 20
            self.dialogView.alpha = 0
        }) { (true) in
            self.dismiss(animated: true, completion: nil)
        }
    }

}
