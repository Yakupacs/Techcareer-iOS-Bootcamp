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
	var contactList = BehaviorSubject<[Contact]>(value: [Contact]())
	
	init(){
		krepo.databaseCopy()
		contactList = krepo.contactList
	}
	
	func search(searchText: String){
		krepo.search(searchText: searchText)
	}
	
	func delete(id: Int){
		krepo.delete(id: id)
		contactUpload()
	}
	
	func contactUpload(){
		krepo.contactUpload()
	}
}
