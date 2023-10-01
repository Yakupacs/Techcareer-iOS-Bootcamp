//
//  DetailVC.swift
//  ProductsApp
//
//  Created by Yakup on 24.09.2023.
//

import UIKit


class DetailVC: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var sepeteEkleButton: UIButton!
	

	var product: Product?
	var indexPath: IndexPath?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		if let p = product {
			self.navigationItem.title = p.title
			imageView.image = UIImage(named: p.image!)
			titleLabel.text = "\(p.title!)₺"
		}
    }

	@IBAction func sepeteEkle(_ sender: Any) {
		if let p = product {
			print("Detay Sayfa: \(p.title!) sepete ekledi!")
		}
	}
}
