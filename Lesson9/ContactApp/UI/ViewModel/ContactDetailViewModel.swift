//
//  ContactDetailViewModel.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation

class ContactDetailViewModel{
	var krepo = ContactDaoRepository()
	
	func update(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
		krepo.update(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
	}
}
