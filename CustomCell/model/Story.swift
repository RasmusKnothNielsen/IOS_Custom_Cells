//
//  Story.swift
//  CustomCell
//
//  Created by Rasmus Knoth Nielsen on 13/03/2020.
//  Copyright © 2020 Rasmus Knoth Nielsen. All rights reserved.
//

import Foundation

class Story {
    
    // Fields
    var text:String
    
    var image:String
    
    // Empty constructor
    init() {
        text = ""
        image = ""
    }
    
    // Constructor
    init(txt:String, img:String) {
        text = txt
        image = img
    }
    
    // Function that returns true if Story has an image-name string
    func hasImage() -> Bool {
        return image.count > 0
    }
    
}
