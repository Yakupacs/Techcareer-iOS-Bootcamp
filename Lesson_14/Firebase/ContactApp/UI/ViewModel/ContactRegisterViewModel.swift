//
//  ContactRegisterViewModel.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation

class ContactRegisterViewModel{
	var krepo = ContactDaoRepository()
	
	
	func save(id: Int, name: String, surname: String, phone: String)
	{
		krepo.save(id: id, name: name, surname: surname, phone: phone)
	}
}
