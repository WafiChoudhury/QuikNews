//
//  ContentModel.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/12/22.
//

import Foundation
import FirebaseCore
import Firebase
import FirebaseFirestore
class ContentModel: NSObject, ObservableObject, Identifiable {

    @Published var news = [NewsObject]()

    @Published var trending = [TrendingModel]()


    override init(){
        
        
        super.init()

        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
            
        }
       
        fetchNews()

    }

    
    func fetchNews(){
        
        let db = Firestore.firestore()
        db.collection("Articles").getDocuments() { (querySnapshot, err) in
            if let err = err{
                
                print(err.localizedDescription)
            }
            else if let querySnapshot = querySnapshot{
                for document in querySnapshot.documents{

                    let body = document.data()["Content"] as? String ?? ""
                    let author = document.data()["Author"] as? String ?? ""
                    let source = document.data()["Source"] as? String ?? ""

                    
                    
                }
            }
        }
    }
    
    func updateTrending(){
                
        news.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic"))
    
    }
}
