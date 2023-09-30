//
//  HomepageViewModel.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation
import RxSwift

class HomepageViewModel{
	var krepo = ContactDaoRepository()
	var contactList = BehaviorSubject<[ContactModel]>(value: [ContactModel]())
	
	init(){
		contactList = krepo.contactList
	}
	
	func search(searchText: String){
		krepo.search(searchText: searchText)
	}
	
	func delete(contact: ContactModel){
		krepo.delete(contact: contact)
		contactUpload()
	}
	
	func contactUpload(){
		krepo.contactUpload()
	}
}
