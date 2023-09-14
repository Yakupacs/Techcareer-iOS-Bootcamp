//
//  ViewController.swift
//  LampApp
//
//  Created by Yakup on 15.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var likeButton: UIButton!
    
    var liked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        liked = false
    }

    @IBAction func likedFunc(_ sender: Any) {
        if (liked == false)
        {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            liked = true
        }
        else
        {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            liked = false
        }
    }
    
}

