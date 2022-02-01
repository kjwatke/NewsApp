//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Kevin  Watke on 1/31/22.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	
	var articleURL: String?
	
    override func viewDidLoad() {

		super.viewDidLoad()

    }
	
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(animated)
		
		// Check that there is a url
		if articleURL != nil {
			
			// Create the URL object
			let url = URL(string: articleURL!)
			
			guard url !=  nil else {
				
				print("Couldn't create the url object")
				return
				
			}
			
			// Create the URLRequest Object
			let request = URLRequest(url: url!)
			
			// Load it into the webView
			webView.load(request)
		}
		
	}
}
