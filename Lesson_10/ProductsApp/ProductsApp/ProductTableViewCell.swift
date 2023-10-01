//
//  ProductTableViewCell.swift
//  ProductsApp
//
//  Created by Yakup on 24.09.2023.
//

import UIKit

protocol CellProtocol {
	func clickedSepeteEkle(indexPath: IndexPath)
}

class ProductTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var imageview: UIImageView!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var sepetButton: UIButton!
	@IBOutlet weak var viewCell: UIView!
	var cellProtocol: CellProtocol?
	var indexPath: IndexPath?

	@IBAction func sepeteEkleClicked(_ sender: Any) {
		cellProtocol?.clickedSepeteEkle(indexPath: indexPath!)
	}
}
