//
//  Product.swift
//  ProductsApp
//
//  Created by Yakup on 24.09.2023.
//

import Foundation
import UIKit

class Product {
	var id: Int?
	var title: String?
	var image: String?
	var price: Int?
	
	init(id: Int? = nil, title: String? = nil, image: String? = nil, price: Int? = nil) {
		self.id = id
		self.title = title
		self.image = image
		self.price = price
	}
}
