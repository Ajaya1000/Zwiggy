//
//  AppDelegate.swift
//  Zwiggy
//
//  Created by Ajaya Mati on 26/01/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
      FirebaseApp.configure()
      let db = Firestore.firestore()
      return true
  }
}
