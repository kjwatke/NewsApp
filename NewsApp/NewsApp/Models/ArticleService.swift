//
//  ArticleService.swift
//  NewsApp
//
//  Created by Kevin  Watke on 1/31/22.
//

import Foundation

struct ArticleService: Decodable {
	
	var totalResults: Int?
	var articles: [Article]?
}
