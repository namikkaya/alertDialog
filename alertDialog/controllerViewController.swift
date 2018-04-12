//
//  controllerViewController.swift
//  alertDialog
//
//  Created by namik kaya on 10.04.2018.
//  Copyright © 2018 namik kaya. All rights reserved.
//

import UIKit

class controllerViewController: UIViewController {
    
    typealias CompletionHandler = (_ success:Bool) -> Void
    
    typealias ButtonAction = () -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addString(string: String, completionHandler: CompletionHandler) {
        let flag = true
        completionHandler(flag)
    }
    
    func addButton(title:String, comment:String, buttonAction:ButtonAction){
        buttonAction()
    }

}
