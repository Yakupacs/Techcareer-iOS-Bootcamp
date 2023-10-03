//
//  ViewController.swift
//  KingfisherLibrary
//
//  Created by Yakup on 3.10.2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var buttonImage1: UIButton!
	@IBOutlet weak var buttonImage2: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		showImage(imageName: "su.png")
	}
	
	@IBAction func button1Actiopn(_ sender: Any) {
		showImage(imageName: "tiramisu.png")
	}
	
	@IBAction func button2Action(_ sender: Any) {
		showImage(imageName: "baklava.png")
	}
	
	func showImage(imageName: String){
		if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(imageName)"){
			DispatchQueue.main.async {
				self.imageView.kf.setImage(with: url)
			}
		}
	}
}

