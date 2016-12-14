//
//  Data.swift
//  Challenge
//
//  Created by Ariela Cohen on 12/14/16.
//  Copyright © 2016 Ariela Cohen. All rights reserved.
//

import Foundation
import UIKit


struct Profile {
    
    static let sharedInstance = Profile()
    
    var profileArray: [Profile] = []
    
    var uniqueID: String = ""
    var name:String = ""
    var age:Int = 0
    var hobbies: [String] = []
    var gender: String = ""
    var cellBackgroundColor = UIColor()
    var profileImage = UIImage()
    
    private init() {}
    
    
}
