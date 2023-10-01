//
//  ViewController.swift
//  MovieApp
//
//  Created by Yakup on 24.09.2023.
//

import UIKit

class HomepageVC: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	
	var movies = [Movie]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		movies.append(Movie(id: 1, title: "Django", image: "django", price: "24"))
		movies.append(Movie(id: 2, title: "The Pianist", image: "thepianist", price: "48"))
		movies.append(Movie(id: 3, title: "Interstellar", image: "interstellar", price: "78"))
		movies.append(Movie(id: 4, title: "The Hateful Eight", image: "thehatefuleight", price: "10"))
		movies.append(Movie(id: 5, title: "Anadoluda", image: "anadoluda", price: "15"))
		movies.append(Movie(id: 6, title: "Inception", image: "inception", price: "199"))
		
		let design = UICollectionViewFlowLayout()

		design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		design.minimumInteritemSpacing = 10
		design.minimumLineSpacing = 10
		
		// 10 X 10 X 10 = 30
		// 15 X 10 X 10 X 15 = 50
		
		let width = UIScreen.main.bounds.width
		
		let itemWidth = (width - 30) / 2
		
		design.itemSize = CGSize(width: itemWidth, height: 270)
		collectionView.collectionViewLayout = design
	}

	
	

}

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource, CellProtocol {
	func sepeteEkleClicked(indexPath: IndexPath) {
		let movie = movies[indexPath.row]
		print(movie.title!)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		movies.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MovieCell {
			cell.imageView.image = UIImage(named: movies[indexPath.row].image!)
			cell.priceLabel.text = movies[indexPath.row].price! + " ₺"
			
			cell.layer.cornerRadius = 15
			cell.layer.borderColor = UIColor.lightGray.cgColor
			cell.layer.borderWidth = 0.3
			cell.indexPath = indexPath
			cell.cellProcotol?.sepeteEkleClicked(indexPath: indexPath)
			
			return cell
		}
		return UICollectionViewCell()
	}
	
	
}
