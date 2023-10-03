//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 21.09.2023.
//

import UIKit

class KisiKayit: UIViewController {

    @IBOutlet weak var tfKisiTel: UITextField!
    @IBOutlet weak var tfKisiAd: UITextField!
    
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ad = tfKisiAd.text,let tel = tfKisiTel.text {
            viewModel.kaydet(kisi_ad: ad, kisi_tel: tel)
        }
    }
}
