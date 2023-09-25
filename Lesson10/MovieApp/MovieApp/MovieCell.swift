//
//  MovieCell.swift
//  MovieApp
//
//  Created by Yakup on 24.09.2023.
//

import UIKit

protocol CellProtocol {
	func sepeteEkleClicked(indexPath: IndexPath)
}

class MovieCell: UICollectionViewCell {
    
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var sepetButton: UIButton!
	@IBOutlet weak var viewBackground: UIView!
	
	var cellProcotol: CellProtocol?
	var indexPath: IndexPath?
	
	@IBAction func sepeteEkleAction(_ sender: Any) {
		cellProcotol?.sepeteEkleClicked(indexPath: indexPath!)
	}
	
	
}
