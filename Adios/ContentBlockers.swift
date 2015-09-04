//
//  ContentBlockers.swift
//  Adios
//
//  Created by Armand Grillet on 25/08/2015.
//  Copyright © 2015 Armand Grillet. All rights reserved.
//

import Foundation
import SafariServices

public class ContentBlockers {
    public class func reload(goodCompletion: (() -> Void), badCompletion: (() -> Void)) {
        SFContentBlockerManager.reloadContentBlockerWithIdentifier("AG.Adios.BaseContentBlocker") { (error: NSError?) -> Void in
            if error == nil {
                print("Le base passe")
                SFContentBlockerManager.reloadContentBlockerWithIdentifier("AG.Adios.ContentBlocker") { (otherError: NSError?) -> Void in
                    if error == nil {
                        print("Listes appliquees")
                        goodCompletion()
                    } else {
                        print(otherError)
                        badCompletion()
                    }
                }
            } else {
                print(error)
                badCompletion()
            }
        }
    }
    
    public class func reloadBaseContentBlocker(callback: (UIBackgroundFetchResult) -> Void) {
        print("Reloading base content blocker")
        SFContentBlockerManager.reloadContentBlockerWithIdentifier("AG.Adios.BaseContentBlocker") { (error: NSError?) -> Void in
            if error == nil {
                print("Success")
                callback(.NewData)
            }
        }
    }
    
    public class func reloadContentBlocker(callback: (UIBackgroundFetchResult) -> Void) {
        print("Reloading content blocker")
        SFContentBlockerManager.reloadContentBlockerWithIdentifier("AG.Adios.ContentBlocker") { (error: NSError?) -> Void in
            if error == nil {
                print("Success")
                callback(.NewData)
            }
        }
    }
}