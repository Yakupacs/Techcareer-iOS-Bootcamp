//
//  ContactDaoRepository.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

// Dao: Database Access Object
class ContactDaoRepository{
	var contactList = BehaviorSubject<[Contact]>(value: [Contact]())
	var collectionKisiler = Firestore.firestore().collection("Kisiler")
	
	func save(name: String, surname: String, phone: String)
	{
		let newContact: [String: Any] = ["kisi_id":"", "kisi_ad": name, "kisi_tel": phone]
		collectionKisiler.document().setData(newContact)
	}
	
	func update(id: String, name: String, surname: String, phone: String) {
		let updateContact: [String:Any] = ["kisi_ad": name, "kisi_tel": phone]
		collectionKisiler.document(id).updateData(updateContact)
	}
	
	func search(searchText: String){
		//		let sorgu = collectionKisiler.whereField("kisi_ad", isEqualTo: searchText)
		
		collectionKisiler.addSnapshotListener { snapshot, error in
			var contacts = [Contact]()
			
			if let documents = snapshot?.documents {
				for document in documents{
					let data = document.data()
					let kisi_id = document.documentID
					let kisi_adi = data["kisi_ad"] as? String ?? "Unknown"
					let kisi_tel = data["kisi_tel"] as? String ?? "Unknown"
					
					if kisi_adi.lowercased().contains(searchText.lowercased()){
						let kisi = Contact(id: kisi_id, firstName: kisi_adi, lastName: "", phoneNumber: kisi_tel)
						contacts.append(kisi)
					}
				}
			}
			
			self.contactList.onNext(contacts)
		}	}
	
	func delete(id: String){
		collectionKisiler.document(id).delete()
	}
	
	func contactUpload(){
		let sorgu = collectionKisiler.order(by: "kisi_ad", descending: true)
		
		sorgu.addSnapshotListener { snapshot, error in
			var contacts = [Contact]()
			
			if let documents = snapshot?.documents {
				for document in documents{
					let data = document.data()
					let kisi_id = document.documentID
					let kisi_adi = data["kisi_ad"] as? String ?? "Unknown"
					let kisi_tel = data["kisi_tel"] as? String ?? "Unknown"
					
					let kisi = Contact(id: kisi_id, firstName: kisi_adi, lastName: "", phoneNumber: kisi_tel)
					contacts.append(kisi)
				}
			}
			
			self.contactList.onNext(contacts)
		}
	}
}
