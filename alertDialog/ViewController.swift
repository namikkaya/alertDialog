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
        dialog.dialogBackgroundColor = UIColor.white
        dialog.dialogTitleColor = UIColor.black
        dialog.dialogTitle = "Delete File!"
        dialog.dialogCommentColor = UIColor.black
        dialog.dialogComment = "Would you like to save your changes?"
        
        dialog.leftButtonAction(title: "Cancel", bg_normal: UIColor.red, bg_highligthed: UIColor.black, textColor_normal: UIColor.white, textColor_highligthed: UIColor.gray) {
            print("left button Action")
        }
        
        dialog.rightButtonAction(title: "Okey", bg_normal: UIColor.blue, bg_highligthed: UIColor.black, textColor_normal: UIColor.white, textColor_highligthed: UIColor.gray) {
            print("right button Action")
        }
        
        
        dialog.modalPresentationStyle = .overFullScreen
        dialog.transitioningDelegate = transitionManager
        self.present(dialog, animated: true, completion: nil)
    }
    
    

}

