//
//  ContactDaoRepository.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation
import RxSwift

// Dao: Database Access Object
class ContactDaoRepository{
	var contactList = BehaviorSubject<[Contact]>(value: [Contact]())
	
	func save(id: Int, name: String, phone: String)
	{
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
		request.httpMethod = "POST"
		let postString = "kisi_ad=\(name)&kisi_tel=\(phone)"
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request){ data, response , error in
			do {
				let response = try JSONDecoder().decode(CRUDResponse.self, from: data!)
				print("------------INSERT--------------")
				print("Success: \(response.success!)")
				print("Message: \(response.message!)")
			}catch{
				print(error.localizedDescription)
			}
		}.resume()
	}
	
	func update(id: Int, name: String, phone: String) {
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
		request.httpMethod = "POST"
		let postString = "kisi_id=\(id)&kisi_ad=\(name)&kisi_tel=\(phone)"
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request){ data, response , error in
			do {
				let response = try JSONDecoder().decode(CRUDResponse.self, from: data!)
				print("-----------UPDATE--------------")
				print("Success: \(response.success!)")
				print("Message: \(response.message!)")
			}catch{
				print(error.localizedDescription)
			}
		}.resume()
	}
	
	func search(searchText: String){
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
		request.httpMethod = "POST"
		let postString = "kisi_ad=\(searchText)"
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request){data,response,error in
			do {
				let response = try JSONDecoder().decode(ContactResponse.self, from: data!)
				if let list = response.contact{
					self.contactList.onNext(list)
				}
			}catch{
				print(error.localizedDescription)
			}
		}.resume()
	}
	
	func delete(id: Int){
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
		request.httpMethod = "DELETE"
		let postString = "kisi_id=\(id)"
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request){ data, response , error in
			do {
				let response = try JSONDecoder().decode(CRUDResponse.self, from: data!)
				print("-----------DELETE--------------")
				print("Success: \(response.success!)")
				print("Message: \(response.message!)")
			}catch{
				print(error.localizedDescription)
			}
		}.resume()
	}
	
	func contactUpload(){
		let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
		
		URLSession.shared.dataTask(with: url){ data, response , error in
			do {
				let response = try JSONDecoder().decode(ContactResponse.self, from: data!)
				if let list = response.contact{
					self.contactList.onNext(list)
				}
			}catch{
				print(error.localizedDescription)
			}
		}.resume()
	}
}
