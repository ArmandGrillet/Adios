//
//  ViewController.swift
//  Adios
//
//  Created by Armand Grillet on 09/08/2015.
//  Copyright © 2015 Armand Grillet. All rights reserved.
//

import UIKit
import SafariServices
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var followed: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let userDefaults = NSUserDefaults(suiteName: "group.AG.Adios") {
            followed.text = userDefaults.arrayForKey("followedLists")?.description
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func seeLogs(sender: UIButton) {
        if let userDefaults = NSUserDefaults(suiteName: "group.AG.Adios") {
            if let easyList = userDefaults.arrayForKey("EasyList") {
                for rule in easyList[0..<100] {
                    print(rule)
                }
            }
        } else {
            print("Impossible de se connecter au groupe")
        }
    }
    
    @IBAction func createFile(sender: UIButton) {
        let path = NSBundle.mainBundle().pathForResource("list", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        if (data != nil) {
            let json = JSON(data: data!)
            for jsonRule in json.array! {
                let rule = Rule(jsonRule: jsonRule)
                print(rule.toString())
            }
        }
        
    }
    
    @IBAction func update(sender: UIButton) {
        SFContentBlockerManager.reloadContentBlockerWithIdentifier("AG.Adios.BaseContentBlocker") { (error: NSError?) -> Void in
            if error == nil {
                print("Le base passe")
                SFContentBlockerManager.reloadContentBlockerWithIdentifier("AG.Adios.ContentBlocker") { (otherError: NSError?) -> Void in
                    if otherError == nil {
                        print("Le base passe")
                    } else {
                        print(otherError)
                    }
                }
            } else {
                print(error)
            }
        }
    }
}