//
//  Article.swift
//  NewsApp
//
//  Created by Kevin  Watke on 1/31/22.
//

import Foundation

struct Article: Decodable {
	var author: String?
	var title: String?
	var description: String?
	var url: String?
	var urlToImage: String?
	var publishedAt: String?
}
