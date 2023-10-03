//
//  Contact.swift
//  ContactApp
//
//  Created by Yakup on 21.09.2023.
//

import Foundation

class Contact {
	var id: Int?
	var firstName: String?
	var lastName: String?
	var phoneNumber: String?
	
	init(id: Int? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil) {
		self.id = id
		self.firstName = firstName
		self.lastName = lastName
		self.phoneNumber = phoneNumber
	}
}
