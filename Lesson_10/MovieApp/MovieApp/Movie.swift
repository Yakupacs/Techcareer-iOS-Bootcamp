//
//  Movie.swift
//  MovieApp
//
//  Created by Yakup on 24.09.2023.
//

import Foundation

class Movie {
	var id: Int?
	var title: String?
	var image: String?
	var price: String?
	
	init(id: Int? = nil, title: String? = nil, image: String? = nil, price: String? = nil) {
		self.id = id
		self.title = title
		self.image = image
		self.price = price
	}
}
