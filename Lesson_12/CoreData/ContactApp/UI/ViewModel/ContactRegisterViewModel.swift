//
//  ContactRegisterViewModel.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation

class ContactRegisterViewModel{
	var krepo = ContactDaoRepository()
	
	
	func save(name: String, surname: String, phone: String)
	{
		krepo.save(name: name, surname: surname, phone: phone)
	}
}
