//
//  AppDelegate.swift
//  MyTravel
//
//  Created by Apple on 01/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import MMDrawerController
import GoogleMaps
import GooglePlaces
import Firebase
import FirebaseAuth


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var centerContainer: MMDrawerController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        
        GMSServices.provideAPIKey("AIzaSyAec-Eb8Nstcov_4wDWEvC5shSIKRe_5z8")
        GMSPlacesClient.provideAPIKey("AIzaSyAec-Eb8Nstcov_4wDWEvC5shSIKRe_5z8")
        FirebaseApp.configure()

        if let userData = userDefaultValueForKey(key: USER_DETAILS) as? NSMutableDictionary{
            print(userData)
            
            moveToFormVC()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func moveToFormVC(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let fromVC = storyboard.instantiateViewController(withIdentifier: "LastTripVisitedVC") as! LastTripVisitedVC
        let nav = UINavigationController(rootViewController: fromVC)
        setDrawer(nav: nav)
    }
    
    func setDrawer(nav:UINavigationController){
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftMenuVC") as! LeftMenuVC
        centerContainer = MMDrawerController(center: nav, leftDrawerViewController: leftViewController)
        
        centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningCenterView;
        centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.panningCenterView;
        
        self.window?.rootViewController = centerContainer
        self.window?.makeKeyAndVisible()
    }

    func showIndicator(view:UIView){
        view.makeToastActivity(.center)
        view.isUserInteractionEnabled = false
    }
    
    func hideIndicator(view:UIView){
        view.hideToastActivity()
        view.isUserInteractionEnabled = true
    }

}

