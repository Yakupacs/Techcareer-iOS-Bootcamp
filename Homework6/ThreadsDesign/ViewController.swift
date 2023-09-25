//
//  ViewController.swift
//  ThreadsDesign
//
//  Created by Yakup on 24.09.2023.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!

	var threads = [Thread(user: "zuck", thread: "I love this sport and I've been ready to fight since the day Elon challenged me. If he ever agrees on an actual date, you'll hear it from me. Until then, please assume anything he says has not been agreed on.", image: UIImage(named: "mark")!, time: "22m"),
				   Thread(user: "webtekno", thread: "Türkiye'de doğuşta beklenen yaşam süresi kadınlarda 80,3 yıl, erkeklerde ise 74,8 yıl olarak hesaplandı. (TÜİK)", image: UIImage(named: "webtekno")!, time: "22m"),
				   Thread(user: "motivasyon.evi", thread: "Unutmayın, eğer anlatmıyorsanız onu besliyorsunuz demektir. Ve gün geçtikçe bu daha da ağırlaşır. Yükünüzden kurtulun.", image: UIImage(named: "motivasyonevi")!, time: "3h"),
				   Thread(user: "thisisbillgates", thread: "What expression in English bothers you the most?", image: UIImage(named: "billgates")!, time: "2m"),
				   Thread(user: "alberteinstein", thread: "Relatively speaking, this is pretty cool.", image: UIImage(named: "alberteinstein")!, time: "10h"),
				   Thread(user: "zuck", thread: "I love this sport and I've been ready to fight since the day Elon challenged me. If he ever agrees on an actual date, you'll hear it from me. Until then, please assume anything he says has not been agreed on.", image: UIImage(named: "mark")!, time: "22m"),
				   Thread(user: "webtekno", thread: "Türkiye'de doğuşta beklenen yaşam süresi kadınlarda 80,3 yıl, erkeklerde ise 74,8 yıl olarak hesaplandı. (TÜİK)", image: UIImage(named: "webtekno")!, time: "22m"),
				   Thread(user: "motivasyon.evi", thread: "Unutmayın, eğer anlatmıyorsanız onu besliyorsunuz demektir. Ve gün geçtikçe bu daha da ağırlaşır. Yükünüzden kurtulun.", image: UIImage(named: "motivasyonevi")!, time: "3h"),
				   Thread(user: "thisisbillgates", thread: "What expression in English bothers you the most?", image: UIImage(named: "billgates")!, time: "2m"),
				   Thread(user: "alberteinstein", thread: "Relatively speaking, this is pretty cool.", image: UIImage(named: "alberteinstein")!, time: "10h")]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.allowsSelection = false
		
		let imageView = UIImageView(image: UIImage(named: "threads"))
		imageView.contentMode = .scaleAspectFit
		let imageBarButtonItem = UIBarButtonItem(customView: imageView)
		navigationItem.titleView = imageBarButtonItem.customView
		
		let refreshControl = UIRefreshControl()
		tableView.refreshControl = refreshControl
		refreshControl.tintColor = .white
		refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
	}

	@objc func refresh(){
		tableView.refreshControl!.endRefreshing()
	}

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return threads.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
		
		let imageView = UIImageView(image: UIImage(named: "heart512"))
		imageView.contentMode = .scaleAspectFit
		imageView.frame = CGRect(x: 0, y: 0, width: cell.likeButton.frame.width - 5, height: cell.likeButton.frame.height - 5)
		cell.likeButton.addSubview(imageView)
		
		let imageView2 = UIImageView(image: UIImage(named: "bubble-chat512"))
		imageView2.contentMode = .scaleAspectFit
		imageView2.frame = CGRect(x: 0, y: 0, width: cell.commentButton.frame.width - 5, height: cell.commentButton.frame.height - 5)
		cell.commentButton.addSubview(imageView2)
		
		let imageView3 = UIImageView(image: UIImage(named: "refreshing512"))
		imageView3.contentMode = .scaleAspectFit
		imageView3.frame = CGRect(x: 0, y: 0, width: cell.repostButton.frame.width - 5, height: cell.repostButton.frame.height - 5)
		cell.repostButton.addSubview(imageView3)
		
		let imageView4 = UIImageView(image: UIImage(named: "send512"))
		imageView4.contentMode = .scaleAspectFit
		imageView4.frame = CGRect(x: 0, y: 0, width: cell.dmButton.frame.width - 5, height: cell.dmButton.frame.height - 5)
		cell.dmButton.addSubview(imageView4)
		
		cell.descriptionLabel.text = threads[indexPath.row].thread
		cell.userNameLabel.text = threads[indexPath.row].user
		cell.descriptionLabel.isSelectable = false
		cell.myImageView.image = threads[indexPath.row].image
		cell.imageButton.layer.borderColor = UIColor.black.cgColor
		cell.imageButton.layer.borderWidth = 1
		cell.imageButton.layer.cornerRadius = 10
		cell.myImageView.layer.cornerRadius = 24
		cell.descriptionLabel.isScrollEnabled = false
		return cell
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let cellText = threads[indexPath.row].thread
		if (cellText.count < 40) {
			return 60 //
		}
		else if (cellText.count < 80) {
			return 130 //
		}
		else if (cellText.count < 120) {
			return 160
		}
		else if (cellText.count < 160) {
			return 210
		}
		else if (cellText.count < 200) {
			return 260
		}
		else if (cellText.count < 240) {
			return 210 //
		}
		else if (cellText.count < 280) {
			return 360
		}
		else {
			return 410
		}
	}
}
