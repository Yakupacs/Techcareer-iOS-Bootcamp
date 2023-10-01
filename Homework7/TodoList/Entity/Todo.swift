//
//  Todo.swift
//  TodoList
//
//  Created by Yakup on 29.09.2023.
//

import Foundation
import UIKit

class Todo{
	var id: Int?
	var title: String
	var done: Int
	
	init(id: Int? = nil, title: String, done: Int) {
		self.id = id
		self.title = title
		self.done = done
	}
}
