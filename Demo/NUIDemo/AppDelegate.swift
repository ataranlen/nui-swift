//
//  AppDelegate.swift
//  NUIDemo
//
//  Created by Sergej Jaskiewicz on 11.06.16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        // If you uncomment this and set the path to your .nss file, you can modify your .nss
        // file at runtime
        // NUISettings.setAutoUpdatePath("/path/to/Style.nss")
        
        NUISettings.initDefault()
        return true
    }
    
}