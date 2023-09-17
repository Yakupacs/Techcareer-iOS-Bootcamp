//
//  ViewController.swift
//  WorkingStructure
//
//  Created by Yakup on 14.09.2023.
//

import UIKit

class HomepageVC: UIViewController {

    @IBOutlet weak var homepageLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Lifecycle: viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Lifecycle: viewWillAppear()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Lifecycle: viewDidAppear()")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Lifecycle: viewDidDisappear()")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Lifecycle: viewWillDisappear()")
    }

    @IBAction func addFunc(_ sender: Any) {
        print("Add Clicked.")
    }
    
    @IBAction func editFunc(_ sender: Any) {
        print("Edit Clicked.")
    }
    
    @IBAction func tapClick(_ sender: Any) {
        count += 1
        homepageLabel.text = String(count)
        if (count == 5)
        {
            performSegue(withIdentifier: "toGameScreen", sender: nil)
        }
    }
    
    @IBAction func startFunc(_ sender: Any) {
        let person = Contact(name: "Yakup", age: 23, height: 1.78, unmarried: true)
        performSegue(withIdentifier: "toGameScreen", sender: person)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGameScreen"
        {
            if let data = sender as? Contact{ // Any(Superclass) > String(Subclass)
                let vc = segue.destination as! GameVC // UIViewControllerden(Superclass) > GameScreen (Upcasting)
                vc.getPerson = data
            }
        }
    }
}

