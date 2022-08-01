//
//  NewsViewModel.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 5/27/22.
//

import Foundation
import FirebaseFirestore
import Firebase
class NewsViewModel: ObservableObject  {
    
    
    
    @Published var articles = [NewsObject]()
    
    init(){
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Art"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Economy"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Crypto"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Real Estate"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Pop Culture"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Tech"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Markets"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Headlines"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Global"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Opinion"))
        articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic", source: "hey", category: "Politics"))

    }
    
    func fetchNews(){
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
            
        }
        
        let db = Firestore.firestore()
        db.collection("Articles").addSnapshotListener { (querySnapshot, error) in
            
            //check errors
            
            //handle changes
            
            guard let documents = querySnapshot?.documents else {
                
                print("error")
                return
            }
            print(documents.count)
            self.articles = documents.map{ (QueryDocumentSnapshot) -> NewsObject in
                
                let data = QueryDocumentSnapshot.data()
                let body = data["Content"] as? String ?? ""
                let author = data["Author"] as? String ?? ""
                let source = data["Source"] as? String ?? ""
                let image = data["Image"] as? String ?? "quikpic"
                let category = data["Category"] as? String ?? ""
                let id = UUID().uuidString
                
                return NewsObject(id: id, title: author, body: body, image: image, source:source, category: category)
                
            }
            
        }
        
    }
}
