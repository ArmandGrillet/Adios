//
//  ViewController.swift
//  Adios
//
//  Created by Armand Grillet on 27/06/2015.
//  Copyright © 2015 Armand Grillet. All rights reserved.
//

import UIKit
import SafariServices
import MMWormhole

class ViewController: UIViewController {
    
    let wormhole = MMWormhole(applicationGroupIdentifier: "group.AG.Adios.List", optionalDirectory: "wormhole")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        wormhole.listenForMessageWithIdentifier("ignore", listener: { (messageObject) -> Void in
            if let message: AnyObject = messageObject {
                print(message)
            }
        })
        
        self.reloadBlockerList(UIButton())
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reloadBlockerList(sender: UIButton) {
        SFContentBlockerManager.reloadContentBlockerWithIdentifier("AG.Adios.List") { (error: NSError?) -> Void in
            print(error)
        }
         wormhole.passMessageObject("yo", identifier: "ignore")
    }
}

