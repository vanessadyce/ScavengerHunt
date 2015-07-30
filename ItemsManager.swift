//
//  ItemsManager.swift
//  ScavengerHunt
//
//  Created by Vanessa Dyce on 7/29/15.
//  Copyright (c) 2015 Vanessa Dyce. All rights reserved.
//

import Foundation

class ItemsManager {
    var items = [ScavengerHuntItem]()
    
    lazy private var archivePath: String = {     //lazy means it takes a lot to do this so we only want to call it once
        let fileManager = NSFileManager.defaultManager()
        let documentDirectoryURLs = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory,
            inDomains: NSSearchPathDomainMask.UserDomainMask) as! [NSURL]
        let archiveURL = documentDirectoryURLs.first!.URLByAppendingPathComponent("ScavengerHuntItems",
            isDirectory: false)
        return archiveURL.path!
    }()
    
    func save() {
        NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
    }
    
    private func unarchivedSavedItems() {
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath){
            let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as! [ScavengerHuntItem]
            items = savedItems
        }
    }
    
    init(){
        unarchivedSavedItems()
    }
}