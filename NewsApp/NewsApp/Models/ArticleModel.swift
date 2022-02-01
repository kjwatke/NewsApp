//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Kevin  Watke on 1/31/22.
//

import Foundation

protocol ArticleModelProtocol {
	
	func articlesRetrieved(_ articles: [Article])
}


class ArticleModel {
	
	var delegate: ArticleModelProtocol?
	
	func getArticles() {
		
		// Fire off the request to the API
		
		// Create a string URL
		let stringURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=07b2cd790e874577b32b231eceb648f9"
		
		// Create a URL object
		let url = URL(string: stringURL)
		
		// Check that it isn't nil
		guard url != nil else {
			
			print("Couldn't create URL")
			return
			
		}
		
		// Get the URL session
		let session = URLSession.shared
		
		// Create the data task
		let dataTask = session.dataTask(with: url!) { data, response, error in
			
			// Check that there are no errors and that there is data
			if error == nil && data != nil {
				
				// Attempt to parse JSON
				let decoder = JSONDecoder()
				
				do {
					
					// Parse the JSON into ArticleService
					let articleService = try decoder.decode(ArticleService.self, from: data!)
					
					// Get the articles
					let articles = articleService.articles!
					
					// Pass it back to the view controller in the main thread
					DispatchQueue.main.async {
						self.delegate?.articlesRetrieved(articles)
					}
					
				}
				catch  {
					
					print("Couldn't decode the data")
					
				}
			}
		}
		
		// Start the data task
		dataTask.resume()
		
	}
}
