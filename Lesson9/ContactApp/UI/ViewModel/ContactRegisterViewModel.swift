//
//  ContactRegisterViewModel.swift
//  ContactApp
//
//  Created by Yakup on 26.09.2023.
//

import Foundation

class ContactRegisterViewModel{
	var krepo = ContactDaoRepository()
	
	func save(kisi_ad: String, kisi_tel: String)
	{
		krepo.save(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
	}
}
