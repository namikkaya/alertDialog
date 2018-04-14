//
//  optionDialog.swift
//  alertDialog
//
//  Created by namik kaya on 12.04.2018.
//  Copyright © 2018 namik kaya. All rights reserved.
//
import Foundation
import UIKit

class optionDialog: UIViewController, UIGestureRecognizerDelegate {
    weak var delegate:UIViewController?
    
    private var buttonStatus:String = "left"
    
    /// background click close
    var backgroundClickable:Bool = true
    
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
    
    private var rightButton:bscButton = {
        let newButton = bscButton()
        newButton.cornerValue = 5
        newButton.highlightedBackgroundColor = UIColor.black
        newButton.normalBackgroundColor = UIColor.yellow
        newButton.normalTextColor = UIColor.black
        newButton.highlightedTextColor = UIColor.yellow
        newButton.setTitle("Right", for: UIControlState.normal)
        return newButton
    }()
    
    
    private var leftButton:bscButton = {
        let newButton = bscButton()
        newButton.cornerValue = 5
        newButton.highlightedBackgroundColor = UIColor.black
        newButton.normalBackgroundColor = UIColor.yellow
        newButton.normalTextColor = UIColor.black
        newButton.highlightedTextColor = UIColor.yellow
        newButton.setTitle("Left", for: UIControlState.normal)
        return newButton
    }()
    
    //---------------------------------------- leftButton
    
    /// left Button Background Color UIControlState.normal
    private var leftButtonBackground_normal:UIColor = UIColor.red{
        didSet{
            leftButton.normalBackgroundColor = leftButtonBackground_normal
        }
    }
    
    /// left Button Background highlighted Color UIControlState.highlighted
    private var leftButtonBackground_highlighted:UIColor = UIColor.black{
        didSet{
            leftButton.highlightedBackgroundColor = leftButtonBackground_highlighted
        }
    }
    
    /// left Button Text Color UIControlState.normal
    private var leftButtonTextColor_normal:UIColor = UIColor.black {
        didSet {
            leftButton.normalTextColor = leftButtonTextColor_normal
        }
    }
    
    /// left Button Text Color UIControlState.highlighted
    private var leftButtonTextColor_highlighted:UIColor = UIColor.darkGray {
        didSet {
            leftButton.highlightedTextColor = leftButtonTextColor_highlighted
        }
    }
    
    //---------------------------------------- rightButton
    
    /// right Button Background Color UIControlState.normal
    private var rightButtonBackground_normal:UIColor = UIColor.red{
        didSet{
            rightButton.normalBackgroundColor = rightButtonBackground_normal
        }
    }
    
    /// right Button Background highlighted Color UIControlState.highlighted
    private var rightButtonBackground_highlighted:UIColor = UIColor.black{
        didSet{
            rightButton.highlightedBackgroundColor = rightButtonBackground_highlighted
        }
    }
    
    /// right Button Text Color UIControlState.normal
    private var rightButtonTextColor_normal:UIColor = UIColor.black {
        didSet {
            rightButton.normalTextColor = rightButtonTextColor_normal
        }
    }
    
    /// right Button Text Color UIControlState.highlighted
    private var rightButtonTextColor_highlighted:UIColor = UIColor.darkGray {
        didSet {
            rightButton.highlightedTextColor = rightButtonTextColor_highlighted
        }
    }
    
    
    // left Button Click Handler
    typealias leftButtonHandler = () -> Void
    var leftHandler:leftButtonHandler?
    
    func leftButtonAction(title:String,
                        bg_normal:UIColor,
                        bg_highligthed:UIColor,
                        textColor_normal:UIColor,
                        textColor_highligthed:UIColor,
                        completion: @escaping leftButtonHandler){
        
        leftHandler = completion as leftButtonHandler
        leftButton.setTitle(title, for: UIControlState.normal)
        leftButtonTextColor_normal = textColor_normal
        leftButtonTextColor_highlighted = textColor_highligthed
        leftButtonBackground_normal = bg_normal
        leftButtonBackground_highlighted = bg_highligthed
    }
    
    // right Button Click Handler
    typealias rightButtonHandler = () -> Void
    var rightHandler:rightButtonHandler?
    
    func rightButtonAction(title:String,
                          bg_normal:UIColor,
                          bg_highligthed:UIColor,
                          textColor_normal:UIColor,
                          textColor_highligthed:UIColor,
                          completion: @escaping rightButtonHandler){
        
        rightHandler = completion as rightButtonHandler
        rightButton.setTitle(title, for: UIControlState.normal)
        rightButtonTextColor_normal = textColor_normal
        rightButtonTextColor_highlighted = textColor_highligthed
        rightButtonBackground_normal = bg_normal
        rightButtonBackground_highlighted = bg_highligthed
    }
    
    
    
    private func close(){
        self.dismiss(animated: true) {
            
            if(self.buttonStatus == "left"){
                if let bHandler = self.leftHandler{
                    bHandler()
                }
            }else{
                if let rHandler = self.rightHandler {
                    rHandler()
                }
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        if backgroundClickable {
            let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.backgroundClick (_:)))
            self.view.addGestureRecognizer(gesture)
            gesture.delegate = self
        }
        
        self.view.addSubview(dialogView)
        dialogView.addSubview(titleText)
        dialogView.addSubview(commentText)
        dialogView.addSubview(leftButton)
        dialogView.addSubview(rightButton)
        
        self.dialogView.translatesAutoresizingMaskIntoConstraints = false
        self.titleText.translatesAutoresizingMaskIntoConstraints = false
        self.commentText.translatesAutoresizingMaskIntoConstraints = false
        self.leftButton.translatesAutoresizingMaskIntoConstraints = false
        self.rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
        
        leftButton.addTarget(self, action: #selector(optionDialog.leftAction(sender:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(optionDialog.rightAction(sender:)), for: .touchUpInside)
        
        UIView.animate(withDuration: 0) {
            self.dialogView.alpha = 0.0
            self.dialogView.frame.origin.y += 40
        }
        
    }
    
    func setupLayout(){
        dialogView.widthAnchor.constraint(equalToConstant: 360).isActive = true
        //dialogView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dialogView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        titleText.topAnchor.constraint(equalTo: dialogView.topAnchor, constant: 16).isActive = true
        titleText.widthAnchor.constraint(equalTo: dialogView.widthAnchor).isActive = true
        titleText.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
        
        commentText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 8).isActive = true
        commentText.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
        commentText.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 16).isActive = true
        
        leftButton.topAnchor.constraint(equalTo: commentText.bottomAnchor, constant: 32).isActive = true
        leftButton.leftAnchor.constraint(equalTo: dialogView.leftAnchor, constant: 16).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        rightButton.topAnchor.constraint(equalTo: leftButton.topAnchor, constant: 0).isActive = true
        rightButton.leftAnchor.constraint(equalTo: leftButton.rightAnchor, constant: 8).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        rightButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        dialogView.bottomAnchor.constraint(equalTo: leftButton.bottomAnchor, constant: 16).isActive = true
    }
    
    @objc func leftAction(sender: UIButton){
        self.buttonStatus = "left"
        UIView.animate(withDuration: 0.1, animations: {
            self.dialogView.frame.origin.y += 20
            self.dialogView.alpha = 0
        }) { (true) in
            self.close()
        }
    }
    
    @objc func rightAction(sender: UIButton){
        self.buttonStatus = "right"
        UIView.animate(withDuration: 0.1, animations: {
            self.dialogView.frame.origin.y += 20
            self.dialogView.alpha = 0
        }) { (true) in
            self.close()
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
    
    @objc func backgroundClick(_ sender:UITapGestureRecognizer){
        UIView.animate(withDuration: 0.1, animations: {
            self.dialogView.frame.origin.y += 20
            self.dialogView.alpha = 0
        }) { (true) in
            self.dismiss(animated: true, completion: nil)
        }
    }

}
