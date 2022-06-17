//
//  TrendingModel.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/15/22.
//

import Foundation

struct TrendingModel: Identifiable{
    
    var image: String
    var category: String?
    var title: String
    var newsArticle: NewsObject
    var id: String
    
    
    enum CodingKeys: String, CodingKey {

        case image
        case category
        case title
        case newsArticle
        case id
        
      }
    
}
