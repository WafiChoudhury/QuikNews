//
//  MainPageView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 5/27/22.
//

import Pages
import SwiftUI

struct MainPageView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    var newsArticles = [NewsObject]()
    @State var index: Int = 0
    
    init(){
        viewModel.articles.append(NewsObject(id: "hey", title: "hey", body: "hey", image: "quikpic"))
    }
    
    var body: some View {
        
        ZStack{
            
            ModelPages(viewModel.articles ,currentPage: $index, navigationOrientation: .vertical,
                       hasControl: false) { pageIndex, objs in
                
                NewsDetailView(obj: viewModel.articles[pageIndex]).ignoresSafeArea()
                
            }
            
         
            
            
        }.onAppear(){
            self.viewModel.fetchNews()
        }
        .ignoresSafeArea()
    }
    
}

