//
//  NewsObject.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/12/22.
//

import Foundation
import SwiftUI

struct NewsObject: Identifiable, Hashable{
    
    var id: String
    var title: String
    var body: String
    var image: String
    var source: String
    var category: String
    enum CodingKeys: String, CodingKey {

          case title
          case body
          case image
          case id
          case source
          case category

      }
    
}


struct author{
    
    var firstName: String
    var lastName: String
    var face: Image
}

