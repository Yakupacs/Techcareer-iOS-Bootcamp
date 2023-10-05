//
//  ViewController.swift
//  NotificationUsage
//
//  Created by Yakup on 5.10.2023.
//

import UIKit

class ViewController: UIViewController {

	var accessControl = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		UNUserNotificationCenter.current().delegate = self
		
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
			self.accessControl = granted
			if granted{
				print("Enabled notifications!")
			}else{
				print("Disabled notifications!")
			}
		}
	}

	@IBAction func notificationAction(_ sender: Any) {
		if accessControl{
			let content = UNMutableNotificationContent()
			content.title = "Seri bitiyor!"
			content.body = "3 günlük serin sona erecek. Haydi gel ve serini uzat!"
			content.badge = 1
			content.sound = .default
			
			// Kaç saniyede bir gözükecek
			// 1 dk sınır üzerinde repeats true yapılmaz.
			let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
			
			let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
			
			UNUserNotificationCenter.current().add(request)
		}
	}
	
}

extension ViewController: UNUserNotificationCenterDelegate{
	// Bildirim uygulama içinde de çalışıyor.
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		completionHandler([.banner, .sound, .badge])
	}
	
	// Bildirime tıklanıldığında gerçekleşecek fonksiyon.
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		print("Selected notification.")
		
		let app = UIApplication.shared
		// Uygulama açıkken bildirime tıklanınca
		if app.applicationState == .active{
			print(".active")
			view.backgroundColor = .green
		}
		// Uygulama aşağı sürüklenmişken
		else if app.applicationState == .inactive{
			print(".inactive")
			view.backgroundColor = .red
		}
		// Uygulama kapatılmışken
		else if app.applicationState == .background{
			print(".background")
			view.backgroundColor = .gray
		}
		
		// Badge değeri sıfırlandı
		app.applicationIconBadgeNumber = 0
		
		completionHandler()
	}
}
