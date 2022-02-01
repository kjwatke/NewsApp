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
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		// Detect the index the user selected
		let indexPath = tableView.indexPathForSelectedRow
		
		guard indexPath != nil else { return  }
		
		// Get the article the user tapped on
		let article = articles[indexPath!.row]
		
		// Get a reference to the detail view controller
		let detailVC = segue.destination as! DetailViewController
		
		// Pass the article URL to the detail view controller
		detailVC.articleURL = article.url!
		print("article: \(article.url)")
		
		
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
		let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
		
		// Get the article that the tableView is asking about
		let article = articles[indexPath.row]
		
		// Customize it
		cell.displayArticle(article)
		
		return cell
	}
}


extension ViewController: UITableViewDelegate {
	
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		
		// User has just selected a row, trigger the segue to go to detail
		performSegue(withIdentifier: "goToDetail", sender: self)
	}
}


