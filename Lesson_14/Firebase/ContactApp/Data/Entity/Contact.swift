//
//  Contact.swift
//  ContactApp
//
//  Created by Yakup on 21.09.2023.
//

import Foundation

class Contact {
	var id: String?
	var firstName: String?
	var lastName: String?
	var phoneNumber: String?
	
	init(){
		
	}
	
	init(id: String, firstName: String, lastName: String, phoneNumber: String) {
		self.id = id
		self.firstName = firstName
		self.lastName = lastName
		self.phoneNumber = phoneNumber
	}
}
