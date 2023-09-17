//
//  Contact.swift
//  WorkingStructure
//
//  Created by Yakup on 17.09.2023.
//

import Foundation

class Contact
{
    var name: String?
    var age: Int?
    var height: Double?
    var unmarried: Bool?
    
    init(name: String, age: Int, height: Double, unmarried: Bool) {
        self.name = name
        self.age = age
        self.height = height
        self.unmarried = unmarried
    }
}
