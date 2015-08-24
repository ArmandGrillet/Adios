//
//  OnboardController.swift
//  Adios
//
//  Created by Armand Grillet on 22/08/2015.
//  Copyright © 2015 Armand Grillet. All rights reserved.
//

import Foundation

class OnboardManager {
    var mainList: String? {
        get {
            if let list = NSUserDefaults.standardUserDefaults().stringForKey("mainList") {
                return list
            } else {
                return getLogicCountry()
            }
        }
        set {
            if newValue != nil {
                NSUserDefaults.standardUserDefaults().setValue(newValue, forKey: "mainList")
            } else {
                NSUserDefaults.standardUserDefaults().setValue(getLogicCountry(), forKey: "mainList")
            }
        }
    }
    var secondList: String? {
        get {
            if let list = NSUserDefaults.standardUserDefaults().stringForKey("secondList") {
                if list == mainList {
                    return "No"
                } else {
                    return list
                }
            } else {
                return "No"
            }
        }
        set {
            if newValue != nil {
                NSUserDefaults.standardUserDefaults().setValue(newValue, forKey: "secondList")
            } else {
                NSUserDefaults.standardUserDefaults().setValue("No", forKey: "secondList")
            }
            
        }
    }
    var blockAdblockWarnings: Bool {
        get {
            return NSUserDefaults.standardUserDefaults().boolForKey("blockAdblockWarnings")
        }
        set {
            NSUserDefaults.standardUserDefaults().setBool(newValue, forKey: "blockAdblockWarnings")
        }
    }
    var antisocial: Bool {
        get {
            return NSUserDefaults.standardUserDefaults().boolForKey("antisocial")
        }
        set {
            NSUserDefaults.standardUserDefaults().setBool(newValue, forKey: "antisocial")
        }
    }
    var privacy: Bool {
        get {
            return NSUserDefaults.standardUserDefaults().boolForKey("privacy")
        }
        set {
            NSUserDefaults.standardUserDefaults().setBool(newValue, forKey: "privacy")
        }
    }
    
    private let lists = ["Arabic region 🇪🇬", "Bulgaria 🇧🇬", "China 🇨🇳", "Czech and Slovak Rep. 🇸🇰", "Denmark 🇩🇰", "France 🇫🇷", "Estonia 🇪🇪", "Germany 🇩🇪", "Greece 🇬🇷", "Hungary 🇭🇺", "Iceland 🇮🇸", "Indonesia 🇮🇩", "Italy 🇮🇹", "Israel 🇮🇱", "Japan 🇯🇵", "Latvia 🇱🇻", "Netherlands 🇳🇱", "Poland 🇵🇱", "Romania 🇷🇴", "Russia 🇷🇺", "United Kingdom 🇬🇧", "U.S.A 🇺🇸"]
    
    func getLogicCountry() -> String {
        switch NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String {
        case "EG", "SA":
            return "Arabic region 🇪🇬"
        case "BG":
            return "Bulgaria 🇧🇬"
        case "CN":
            return "China 🇨🇳"
        case "CZ", "SK":
            return "Czech and Slovak Rep. 🇸🇰"
        case "DK":
            return "Denmark 🇩🇰"
        case "FR":
            return "France 🇫🇷"
        case "EE":
            return "Estonia 🇪🇪"
        case "DE":
            return "Germany 🇩🇪"
        case "GR":
            return "Greece 🇬🇷"
        case "HU":
            return "Hungary 🇭🇺"
        case "IS":
            return "Iceland 🇮🇸"
        case "ID":
            return "Indonesia 🇮🇩"
        case "IT":
            return "Italy 🇮🇹"
        case "IL":
            return "Israel 🇮🇱"
        case "JP":
            return "Japan 🇯🇵"
        case "LV":
            return "Latvia 🇱🇻"
        case "NL":
            return "Netherlands 🇳🇱"
        case "PL":
            return "Poland 🇵🇱"
        case "RO":
            return "Romania 🇷🇴"
        case "RU":
            return "Russia 🇷🇺"
        case "GB":
            return "United Kingdom 🇬🇧"
        default:
            return "U.S.A 🇺🇸"
        }
    }
    
    func getRealList(flag: String) -> String? {
        print(flag)
        switch flag {
        case "🇪🇬":
            return "EasyList_Arabic"
        case "🇧🇬":
            return "EasyList_Bulgaria"
        case "🇨🇳":
            return "EasyList_China"
        case "🇸🇰":
            return "EasyList_Czechoslovakia"
        case "🇩🇰":
            return "List_Danish"
        case "🇫🇷":
            return "EasyList_France"
        case "🇪🇪":
            return "List_Estonia"
        case "🇩🇪":
            return "EasyList_Germany"
        case "🇬🇷":
            return "EasyList_Greece"
        case "🇭🇺":
            return "List_Hungary"
        case "🇮🇸":
            return "EasyList_Iceland"
        case "🇮🇩":
            return "EasyList_Indonesia"
        case "🇮🇹":
            return "EasyList_Italy"
        case "🇮🇱":
            return "EasyList_Hebrew"
        case "🇯🇵":
            return "List_Japan"
        case "🇱🇻":
            return "EasyList_Latvia"
        case "🇳🇱":
            return "EasyList_Dutch"
        case "🇵🇱":
            return "EasyList_Poland"
        case "🇷🇴":
            return "EasyList_Romania"
        case "🇷🇺":
            return "EasyList_Russia"
        case "🇬🇧":
            return "List_England"
        case "🇺🇸":
            return "EasyList"
        default:
            return nil
        }
    }
    
    func getCountryFromList(list: String) -> String? {
        switch list {
        case "EasyList_Arabic":
            return "Arabic region 🇪🇬"
        case "EasyList_Bulgaria":
            return "Bulgaria 🇧🇬"
        case "EasyList_China":
            return "China 🇨🇳"
        case "EasyList_Czechoslovakia":
            return "Czech and Slovak Rep. 🇸🇰"
        case "List_Danish":
            return "Denmark 🇩🇰"
        case "EasyList_France":
            return "France 🇫🇷"
        case "List_Estonia":
            return "Estonia 🇪🇪"
        case "EasyList_Germany":
            return "Germany 🇩🇪"
        case "EasyList_Greece":
            return "Greece 🇬🇷"
        case "List_Hungary":
            return "Hungary 🇭🇺"
        case "EasyList_Iceland":
            return "Iceland 🇮🇸"
        case "EasyList_Indonesia":
            return "Indonesia 🇮🇩"
        case "EasyList_Italy":
            return "Italy 🇮🇹"
        case "EasyList_Hebrew":
            return "Israel 🇮🇱"
        case "List_Japan":
            return "Japan 🇯🇵"
        case "EasyList_Latvia":
            return "Latvia 🇱🇻"
        case "EasyList_Dutch":
            return "Netherlands 🇳🇱"
        case "EasyList_Poland":
            return "Poland 🇵🇱"
        case "EasyList_Romania":
            return "Romania 🇷🇴"
        case "EasyList_Russia":
            return "Russia 🇷🇺"
        case "List_England":
            return "United Kingdom 🇬🇧"
        case "EasyList":
            return "U.S.A 🇺🇸"
        default:
            return nil
        }
    }
    
    func getMainLists() -> [String] {
        return lists
    }
    
    func getMainListPosition() -> Int {
        return lists.indexOf(mainList!)!
    }
    
    func getSecondLists() -> [String] {
        var secondLists = lists
        secondLists.removeAtIndex(secondLists.indexOf(mainList!)!)
        secondLists.insert("No", atIndex: 0)
        return secondLists
    }
    
    func getSecondListPosition() -> Int {
        return getSecondLists().indexOf(secondList!)!
    }
    
    func getRealListsFromChoices() -> [String] {
        var realLists: [String] = []
        
        let mainListFlag = mainList!.substringFromIndex(mainList!.endIndex.predecessor())
        if let realMainList = getRealList(mainListFlag) {
            print(realMainList)
            realLists.append(realMainList)
        }
        
        if secondList! != "No" {
            let secondListFlag = secondList!.substringFromIndex(secondList!.endIndex.predecessor())
            if let realSecondList = getRealList(secondListFlag) {
                realLists.append(realSecondList)
            }
        }
        
        if blockAdblockWarnings {
            realLists.append("AdblockWarningRemoval")
        }
        if antisocial {
            realLists.append("EasyList_SocialMedia")
        }
        if privacy {
            realLists.append("EasyPrivacy")
        }
        
        realLists.append("AdiosList")
        
        return realLists
    }
    
    func reset() {
        mainList = nil
        secondList = nil
        blockAdblockWarnings = true
        antisocial = true
        privacy = true
    }
}