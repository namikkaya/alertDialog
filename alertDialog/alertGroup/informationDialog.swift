//
//  informaitonViewController.swift
//  alertDialog
//
//  Created by namik kaya on 10.04.2018.
//  Copyright © 2018 namik kaya. All rights reserved.
//

import UIKit


class informationDialog: UIViewController {
    weak var delegate:UIViewController?
    var buttonHandler:CompletionHandler?
    
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
    
    /// Dialog Window Positive Button Background Color UIControlState.normal
    private var dialogButtonPositiveBackground_normal:UIColor = UIColor.red{
        didSet{
            bButton.normalBackgroundColor = dialogButtonPositiveBackground_normal
        }
    }
    
    /// Dialog Window Positive Button Background highlighted Color UIControlState.highlighted
    private var dialogButtonPositiveBackground_highlighted:UIColor = UIColor.black{
        didSet{
            bButton.highlightedBackgroundColor = dialogButtonPositiveBackground_highlighted
        }
    }
    
    /// Dialog Window Positive Button Text Color UIControlState.normal
    private var dialogButtonPositiveTextColor_normal:UIColor = UIColor.black {
        didSet {
            bButton.normalTextColor = dialogButtonPositiveTextColor_normal
        }
    }
    
    /// Dialog Window Positive Button Text Color UIControlState.highlighted
    private var dialogButtonPositiveTextColor_highlighted:UIColor = UIColor.darkGray {
        didSet {
            bButton.highlightedTextColor = dialogButtonPositiveTextColor_highlighted
        }
    }
    
    // Button Click Handler
    typealias CompletionHandler = () -> Void
    
    func PositiveButton(title:String,
                        bg_normal:UIColor,
                        bg_highligthed:UIColor,
                        textColor_normal:UIColor,
                        textColor_highligthed:UIColor,
                        completion: @escaping CompletionHandler){
        
        buttonHandler = completion as CompletionHandler
        bButton.setTitle(title, for: UIControlState.normal)
        dialogButtonPositiveTextColor_normal = textColor_normal
        dialogButtonPositiveTextColor_highlighted = textColor_highligthed
        dialogButtonPositiveBackground_normal = bg_normal
        dialogButtonPositiveBackground_highlighted = bg_highligthed
        
    }
    
    
    private func close(){
        self.dismiss(animated: true) {
            if let bHandler = self.buttonHandler{
                bHandler()
            }
        }
    }
    
    private var bButton:bscButton = {
        let newButton = bscButton()
        newButton.cornerValue = 5
        newButton.highlightedBackgroundColor = UIColor.black
        newButton.normalBackgroundColor = UIColor.yellow
        newButton.normalTextColor = UIColor.black
        newButton.highlightedTextColor = UIColor.yellow
        newButton.setTitle("Tamam", for: UIControlState.normal)
        return newButton
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        self.view.addSubview(dialogView)
        dialogView.addSubview(titleText)
        dialogView.addSubview(commentText)
        dialogView.addSubview(bButton)
        
        
        self.dialogView.translatesAutoresizingMaskIntoConstraints = false
        self.titleText.translatesAutoresizingMaskIntoConstraints = false
        self.commentText.translatesAutoresizingMaskIntoConstraints = false
        self.bButton.translatesAutoresizingMaskIntoConstraints = false
        
        bButton.addTarget(self, action: #selector(informationDialog.actionWithParam(sender:)), for: .touchUpInside)
        
        setupLayout()
        
        UIView.animate(withDuration: 0) {
            self.dialogView.alpha = 0.0
            self.dialogView.frame.origin.y += 40
            
        }
        
    }
    
    func setupLayout(){
        
        dialogView.widthAnchor.constraint(equalToConstant: 360).isActive = true
        dialogView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        dialogView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        titleText.topAnchor.constraint(equalTo: dialogView.topAnchor, constant: 16).isActive = true
        titleText.widthAnchor.constraint(equalTo: dialogView.widthAnchor).isActive = true
        titleText.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
        
        commentText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 8).isActive = true
        commentText.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor).isActive = true
        commentText.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 16).isActive = true
        
        bButton.topAnchor.constraint(equalTo: commentText.bottomAnchor, constant: 32).isActive = true
        bButton.widthAnchor.constraint(equalTo: dialogView.widthAnchor, constant: -64).isActive = true
        //bButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        bButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        bButton.centerXAnchor.constraint(equalTo: dialogView.centerXAnchor, constant: 0).isActive = true
        
        dialogView.bottomAnchor.constraint(equalTo: bButton.bottomAnchor, constant: 16).isActive = true
    }
    
    
    
    
    @objc func actionWithParam(sender: UIButton){
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
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //setupLayout()
    }
    
    override var shouldAutorotate: Bool{
        //dialogView.center = self.view.center
        return true
    }


}
