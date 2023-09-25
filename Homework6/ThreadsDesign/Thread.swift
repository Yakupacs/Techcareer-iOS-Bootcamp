//
//  Thread.swift
//  ThreadsDesign
//
//  Created by Yakup on 25.09.2023.
//

import Foundation
import UIKit

class Thread{
	var user: String
	var thread: String
	var image: UIImage
	var time: String
	
	init(user: String, thread: String, image: UIImage, time: String) {
		self.user = user
		self.thread = thread
		self.image = image
		self.time = time
	}
}
