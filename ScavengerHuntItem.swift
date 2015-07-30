//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Vanessa Dyce on 7/29/15.
//  Copyright (c) 2015 Vanessa Dyce. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    
    let name: String
    var photo: UIImage?
    
    var isCompleted: Bool{
        get {
            return photo != nil
        }
    }
    
    let nameKey = "name"
    let photoKey = "photo"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(thePhoto, forKey: photoKey)
        }
    }
    
    required init(coder aDecoder: NSCoder){
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        photo = aDecoder.decodeObjectForKey(photoKey) as? UIImage
    }
    
    init(name: String){
        self.name = name
    }
}
