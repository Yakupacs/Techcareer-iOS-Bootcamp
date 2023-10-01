//
//  ContactDetailViewModel.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation

class ContactDetailViewModel{
	var krepo = ContactDaoRepository()
	
	func update(id: Int, name: String, phone: String) {
		krepo.update(id: id, name: name, phone: phone)
	}
}
