//
//  DetailViewController.swift
//  lab3_b
//
//  Created by CU Boulder on 2/24/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
                loadWebPage(_urlString: detail.description)
            }
        }
    }
    
    func loadWebPage(_urlString: String){
        //the urlString should be a property fomred url
        //creates a url object
        let myurl = URL(string: _urlString)
        //create a urlRequest object
        let request = URLRequest(url: myurl!)
        //load the urlRequest object in the web view
        webView.load(request)
    }
    
    func webView(_ _webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        webSpinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        webSpinner.stopAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

