//
//  ContactResponse.swift
//  ContactApp
//
//  Created by Yakup on 1.10.2023.
//

import Foundation

class ContactResponse: Codable{
	var contact: [Contact]?
	var success: Int?
}
