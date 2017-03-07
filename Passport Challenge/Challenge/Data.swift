//
//  Data.swift
//  Challenge
//
//  Created by Ariela Cohen on 12/14/16.
//  Copyright © 2016 Ariela Cohen. All rights reserved.
//

import Foundation
import UIKit
import Firebase



struct Profile {

    var uniqueID: String = ""
    var name:String = ""
    var age:String = ""
    var hobbies: [String] = []
    var gender: String = ""
    var cellBackgroundColor = UIColor()
    var profileImage = UIImage()
    var ref = FIRDatabaseReference()
    
    init (name: String, age: String, gender: String){
        
        self.name = name
        self.age = age
//        self.hobbies = hobbies
        self.gender = gender
//        self.cellBackgroundColor = backgroundColor
//        self.profileImage = profileImage
    }
    
    init (snapshot: FIRDataSnapshot){
        uniqueID = snapshot.key
        let snapshotValue = snapshot.value as! [String: Any]
        name = snapshotValue["name"] as! String
        age = snapshotValue["age"] as! String
        hobbies = snapshotValue["hobbies"] as! [String]
        gender = snapshotValue["gender"] as! String
        cellBackgroundColor = snapshotValue["background color"] as! UIColor
        profileImage = snapshotValue["profile image"] as! UIImage
        ref = snapshot.ref
    }

    
    func dataIntoAny() -> Any {
        
        
        return [
            "name": name,
            "age" : age,
            "gender" : gender,
            "hobbies": hobbies,
            "background color": cellBackgroundColor,

        ]
    }

    
    
    
}
