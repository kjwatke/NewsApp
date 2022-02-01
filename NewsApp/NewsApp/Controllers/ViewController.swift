//
//  ViewController.swift
//  NewsApp
//
//  Created by Kevin  Watke on 1/31/22.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var model = ArticleModel()
	var articles = [Article]()

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		// Set the viewController as the datasource and delegate of the tableView
		tableView.dataSource = self
		tableView.delegate = self
		
		// Get the articles from the article model
		model.delegate = self
		model.getArticles()
	}
}

// MARK: - ArticleModel Delegate Methods

extension ViewController: ArticleModelProtocol {
	func articlesRetrieved(_ articles: [Article]) {
		self.articles = articles
		
		// Refresh the tableView
		tableView.reloadData()
	}
	
	
}

// MARK: - UITableView Data Source Methods

extension ViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articles.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// Get a cell
		let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
		
		// TODO: Customize the cell
		
		return cell
	}
}


extension ViewController: UITableViewDelegate {
	
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
}


