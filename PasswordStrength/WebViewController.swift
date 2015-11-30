//
//  WebViewController.swift
//  PasswordStrength
//
//  Created by Dylan Iruretagoyena on 2015-11-29.
//  Copyright © 2015 Micheal Griffin. All rights reserved.
//

import Foundation
import UIKit
import WebKit


class WebViewController: UIViewController, WKNavigationDelegate {
    
    
   // @IBOutlet weak var openInSafari: UIWebView!
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://support.google.com/accounts/answer/32040?hl=en")!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
