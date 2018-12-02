//
//  AppDelegate.swift
//  ProtectedApp
//
//  Created by Usman Nisar on 12/1/18.
//  Copyright © 2018 HappyCoding. All rights reserved.
//

import UIKit

//keeping it global for sample app...
//in you apps you might dont need this value
//as you will be using a single option
var selectedOption = 1

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        if selectedOption == 1
        {
            self.window?.isHidden = true
        }
        else if selectedOption == 2
        {
            // fill screen with our own colour
            let securityView = UIView.init(frame: self.window!.frame)
            securityView.backgroundColor = UIColor.white
            securityView.tag = 1122
            securityView.alpha = 0;
            self.window?.addSubview(securityView)
            self.window?.bringSubviewToFront(securityView)
            
            // fade in the view
            UIView.animate(withDuration: 0.5) {
                //
                securityView.alpha = 1
            }
        }
        else if selectedOption == 3
        {
            let imageView = UIImageView.init(frame: self.window!.frame)
            imageView.tag = 1122
            imageView.image = #imageLiteral(resourceName: "authorizedonly")
            imageView.alpha = 0;
            self.window?.addSubview(imageView)
            self.window?.bringSubviewToFront(imageView)
            
            // fade in the view
            UIView.animate(withDuration: 0.5) {
                //
                imageView.alpha = 1
            }
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if selectedOption == 1
        {
            self.window?.isHidden = false
        }
        else if selectedOption == 2
        {
            let securityView = self.window?.viewWithTag(1122)
            UIView.animate(withDuration: 0.5, animations: {
                //
                securityView?.alpha = 0
            }) { (completed) in
                //
                securityView?.removeFromSuperview()
            }
        }
        else if selectedOption == 3
        {
            let imageView = self.window?.viewWithTag(1122)
            UIView.animate(withDuration: 0.5, animations: {
                //
                imageView?.alpha = 0
            }) { (completed) in
                //
                imageView?.removeFromSuperview()
            }
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

