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
 
                let id = UUID().uuidString
                
                return NewsObject(id: id, title: author, body: body, image: image
                )
            }
            
        }

}
}
