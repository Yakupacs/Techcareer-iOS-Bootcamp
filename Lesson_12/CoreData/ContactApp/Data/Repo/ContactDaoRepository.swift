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
	
	func save(name: String, surname: String, phone: String){
		let person = ContactModel(context: context)
		person.person_name = name
		person.person_surname = surname
		person.person_tel = phone
		
		appDelegate.saveContext()
	}
	
	func update(contact: ContactModel, name: String, surname: String, phone: String) {
		contact.person_name = name
		contact.person_surname = surname
		contact.person_tel = phone
		
		appDelegate.saveContext()
	}
	
	func search(searchText: String){
		do {
			let fr = ContactModel.fetchRequest()
			fr.predicate = NSPredicate(format: "person_name CONTAINS[c] %@", searchText)
			
			let list = try context.fetch(fr)
			
			contactList.onNext(list)
		} catch{
			print(error.localizedDescription)
		}
	}
	
	func delete(contact: ContactModel){
		context.delete(contact)
		
		appDelegate.saveContext()
	}
	
	func contactUpload(){
		do {
			let list = try context.fetch(ContactModel.fetchRequest())
			contactList.onNext(list)
		} catch{
			print(error.localizedDescription)
		}
	}
}
