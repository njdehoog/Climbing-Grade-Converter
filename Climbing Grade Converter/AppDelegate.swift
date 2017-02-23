//
//  AppDelegate.swift
//  Climbing Grade Converter
//
//  Created by Niels de Hoog on 23/02/2017.
//  Copyright © 2017 Invisible Pixel. All rights reserved.
//

import ReSwift

var store = Store<AppState>(reducer: AppReducer(), state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
}

