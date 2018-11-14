//
//  PlaceDetailVC.swift
//  MyTravel
//
//  Created by Apple on 11/10/18.
//  Copyright © 2018 Emple. All rights reserved.
//

import UIKit
import WebKit

class PlaceDetailVC: UIViewController, WKNavigationDelegate {

    var placeURL = ""
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.navigationDelegate = self
       self.view = webView
        // Do any additional setup after loading the view.
        
        let url = URL(string: "placeURL")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
