//
//  ContactDaoRepository.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation
import RxSwift
import CoreData

// Dao: Database Access Object
class ContactDaoRepository{
	var contactList = BehaviorSubject<[ContactModel]>(value: [ContactModel]())
	
	let context = appDelegate.persistentContainer.viewContext
	
	func save(name: String, surname: String, phone: String)
	{
	}
	
	func update(contact: ContactModel, name: String, surname: String, phone: String) {
	}
	
	func search(searchText: String){
	}
	
	func delete(contact: ContactModel){
	}
	
	func contactUpload(){

//		contactList.onNext(contacts)
	}
}
