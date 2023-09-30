//
//  AppDelegate.swift
//  ContactApp
//
//  Created by Yakup on 21.09.2023.
//

import CoreData
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "Model")
		container.loadPersistentStores { storeDescription, error in
			if let e = error{
				print("Error: \((e as NSError).userInfo)")
			}
		}
		return container
	}()
	
	func saveContext(){
		let context = persistentContainer.viewContext
		if context.hasChanges{
			do {
				try context.save()
			} catch{
				print("Error: \((error as NSError).userInfo)")
			}
		}
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		return true
	}

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
	}


}

