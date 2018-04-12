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
        dialog.dialogTitle = "Yeni Başlık!"
        dialog.dialogCommentColor = UIColor.white
        dialog.dialogComment = "Scarlett Johansson daş gibi daş. Çirkin diyen daşa döner."
        
        dialog.PositiveButton(title: "OK",
                              bg_normal: UIColor.darkGray,
                              bg_highligthed: UIColor.lightGray,
                              textColor_normal: UIColor.white,
                              textColor_highligthed: UIColor.black) {
            
            print("dialog button work !")
        }
        
        dialog.modalPresentationStyle = .overFullScreen
        dialog.transitioningDelegate = transitionManager
        self.present(dialog, animated: true, completion: nil)
    }
    

}

