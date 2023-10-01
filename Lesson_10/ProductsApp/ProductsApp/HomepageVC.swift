//
//  ViewController.swift
//  ProductsApp
//
//  Created by Yakup on 24.09.2023.
//

import UIKit

class HomepageVC: UIViewController {
	
	var products = [Product]()
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let p1 = Product(id: 1, title: "Macbook Pro 14", image: "bilgisayar", price: 43000)
		let p2 = Product(id: 2, title: "Rayban Club Master", image: "gozluk", price: 2500)
		let p3 = Product(id: 3, title: "Sony ZX Series", image: "kulaklik", price: 40000)
		let p4 = Product(id: 4, title: "Gio Armani", image: "parfum", price: 2000)
		let p5 = Product(id: 5, title: "Casio X Series", image: "saat", price: 8000)
		let p6 = Product(id: 6, title: "Dyson V8", image: "supurge", price: 18000)
		let p7 = Product(id: 7, title: "iPhone 13", image: "telefon", price: 32000)
		
		products.append(p1)
		products.append(p2)
		products.append(p3)
		products.append(p4)
		products.append(p5)
		products.append(p6)
		products.append(p7)
		
		tableView.delegate = self
		tableView.dataSource = self
	}
	

	
}

extension HomepageVC: UITableViewDelegate, UITableViewDataSource, CellProtocol {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return products.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductTableViewCell
		let product = products[indexPath.row]
		
		cell.imageview.image = UIImage(named: product.image!)
		cell.priceLabel.text = "\(product.price!)₺"
		cell.titleLabel.text = product.title
		cell.viewCell.layer.cornerRadius = 20
		cell.cellProtocol = self
		cell.indexPath = indexPath
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let product = products[indexPath.row]
		let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { ca, v, b in
			print("\(product.title!) silindi.")
		}
		let editAction = UIContextualAction(style: .normal, title: "Düzenle") { ca, v, b in
			print("\(product.title!) düzenlendi.")
		}
		
		return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let product = products[indexPath.row]
		performSegue(withIdentifier: "toDetail", sender: product)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "toDetail"{
			if let product = sender as? Product {
				if let vc = segue.destination as? DetailVC {
					vc.product = product
				}
			}
		}
	}
	func clickedSepeteEkle(indexPath: IndexPath) {
		let product = products[indexPath.row]
		print("\(product.title!) sepete eklendi.")
	}
}
