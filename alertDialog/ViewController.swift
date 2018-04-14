//
//  ViewController.swift
//  alertDialog
//
//  Created by namik kaya on 10.04.2018.
//  Copyright © 2018 namik kaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let transitionManager = alertTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func informationButtonAction(_ sender: Any) {
       openInformationDialog()
        
    }
    
    func openInformationDialog(){
        let dialog = informationDialog()
        dialog.delegate = self
        dialog.dialogCorner = 10
        dialog.dialogBackgroundColor = UIColor.black
        dialog.dialogTitleColor = UIColor.white
        dialog.dialogTitle = "Hello Dude!"
        dialog.dialogCommentColor = UIColor.white
        dialog.dialogComment = "The whole world wants to know what you're feeling right now."
        
        dialog.PositiveButton(title: "OK",
                              bg_normal: UIColor.clear, //UIColor.darkGray
                              bg_highligthed: UIColor.clear, //UIColor.lightGray
                              textColor_normal: UIColor.white,
                              textColor_highligthed: UIColor.blue) {
            
            print("dialog button work !")
        }
        
        dialog.modalPresentationStyle = .overFullScreen // pop up
        dialog.transitioningDelegate = transitionManager // viewController animation
        self.present(dialog, animated: true, completion: nil)
    }
    

    @IBAction func openOptionDialog(_ sender: Any) {
        let dialog = optionDialog()
        dialog.delegate = self
        dialog.dialogCorner = 10
        dialog.backgroundClickable = false // background click close window
        dialog.dialogBackgroundColor = UIColor.white
        dialog.dialogTitleColor = UIColor.black
        dialog.dialogTitle = "Delete File!"
        dialog.dialogCommentColor = UIColor.black
        dialog.dialogComment = "Would you like to save your changes?"
        
        dialog.leftButtonAction(title: "Cancel", bg_normal: UIColor.red, bg_highligthed: UIColor.black, textColor_normal: UIColor.white, textColor_highligthed: UIColor.gray) {
            print("Left Button Handler Work!")
        }
        
        dialog.rightButtonAction(title: "Okey", bg_normal: UIColor.blue, bg_highligthed: UIColor.black, textColor_normal: UIColor.white, textColor_highligthed: UIColor.gray) {
            print("Right Button Handler Work!")
        }
        
        
        dialog.modalPresentationStyle = .overFullScreen
        dialog.transitioningDelegate = transitionManager
        self.present(dialog, animated: true, completion: nil)
    }
    
    
    // Multi Optional Create Alert
    @IBAction func multiOptionAction(_ sender: Any) {
        let dialog = multiOptionDialog()
        dialog.dialogCorner = 5
        dialog.backgroundClickable = true // background click close window
        dialog.dialogTitle = "Question ?"
        dialog.dialogComment = "what is your favorite team? "
        
        
        dialog.addButton(button: multiOptionDialogAction(rect: CGRect(x: 0, y: 0, width: 100, height: 100),
                                                         title: "Galatasaray",
                                                         bgColorNormal: UIColor.white,
                                                         bgColorHighlighted: UIColor.blue,
                                                         textColorNormal: UIColor.blue,
                                                         textColorHighlighted: UIColor.white,
                                                         corner: 10,
                                                         borderWidth: 1,
                                                         borderColorNormal: UIColor.blue,
                                                         borderColorHighligted: UIColor.black,
                                                         complete: {
                                                            print("Option 1: Galatasaray")
        }))
        dialog.addButton(button: multiOptionDialogAction(rect: CGRect(x: 0, y: 0, width: 100, height: 100),
                                                         title: "Real Madrid",
                                                         bgColorNormal: UIColor.white,
                                                         bgColorHighlighted: UIColor.blue,
                                                         textColorNormal: UIColor.blue,
                                                         textColorHighlighted: UIColor.white,
                                                         corner: 10,
                                                         borderWidth: 1,
                                                         borderColorNormal: UIColor.blue,
                                                         borderColorHighligted: UIColor.black,
                                                         complete: {
                                                            print("Option 2: Real Madrid")
        }))
        dialog.addButton(button: multiOptionDialogAction(rect: CGRect(x: 0, y: 0, width: 100, height: 100),
                                                         title: "Barcelona",
                                                         bgColorNormal: UIColor.white,
                                                         bgColorHighlighted: UIColor.blue,
                                                         textColorNormal: UIColor.blue,
                                                         textColorHighlighted: UIColor.white,
                                                         corner: 10,
                                                         borderWidth: 1,
                                                         borderColorNormal: UIColor.blue,
                                                         borderColorHighligted: UIColor.black,
                                                         complete: {
                                                            print("Option 3: Barcelona")
        }))
        
        dialog.addButton(button: multiOptionDialogAction(rect: CGRect(x: 0, y: 0, width: 100, height: 100),
                                                         title: "Cancel",
                                                         bgColorNormal: UIColor.red,
                                                         bgColorHighlighted: UIColor.black,
                                                         textColorNormal: UIColor.white,
                                                         textColorHighlighted: UIColor.white,
                                                         corner: 10,
                                                         borderWidth: 1,
                                                         borderColorNormal: UIColor.blue,
                                                         borderColorHighligted: UIColor.black,
                                                         complete: {
                                                            print("Cancel")
        }))
        
        
        
        
        dialog.modalPresentationStyle = .overFullScreen
        dialog.transitioningDelegate = transitionManager
        self.present(dialog, animated: true, completion: nil)
    }
    

}

