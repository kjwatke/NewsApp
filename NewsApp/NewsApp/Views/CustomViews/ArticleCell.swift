//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Kevin  Watke on 1/31/22.
//

import UIKit

class ArticleCell: UITableViewCell {

	@IBOutlet weak var headlineLabel: UILabel!
	
	@IBOutlet weak var articleImageView: UIImageView!
	
	var articleToDisplay: Article?
	
	
	func displayArticle(_ article: Article) {

		// Clean up the cell before displaying the next article
		articleImageView.image = nil
		headlineLabel.text = ""
		
		// Keep a reference to the article
		articleToDisplay = article
		
		// Set the headline
		headlineLabel.text = articleToDisplay!.title
		
		// Download the image and display it
		
		// Check that the article actully has an image
		guard articleToDisplay!.urlToImage != nil else {
			return
		}
		
		// Create the URL String
		let urlString = articleToDisplay!.urlToImage!
		
		// Create the url
		let url = URL(string: urlString)
		
		// Check that the url isn't nil
		guard url != nil else { return }
		
		// Get a URLSession
		let session = URLSession.shared
		
		// Create a datatask
		let dataTask = session.dataTask(with: url!) { (data, response, error) in
			
			// Check that there is no error
			if error == nil && data != nil {
				
				// Check if the url string that the data task went off to download matches the article this cell is set to display
				if self.articleToDisplay!.urlToImage == urlString {
					
					DispatchQueue.main.async {
						
						self.articleImageView.image = UIImage(data: data!)
						
					}
					
				// Display the image data in the image view
				}
				
			}
		}
		
		// Kick off the datatask
		dataTask.resume()
		
	}
	
	
    override func awakeFromNib() {
        
		super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
		super.setSelected(selected, animated: animated)

    }

}
