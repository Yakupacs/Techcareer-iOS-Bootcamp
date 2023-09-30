//
//  ContactDetailViewModel.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation

class ContactDetailViewModel{
	var krepo = ContactDaoRepository()
	
	func update(contact: ContactModel, name: String, surname: String, phone: String) {
		krepo.update(contact: contact, name: name, surname: surname, phone: phone)
	}
}
