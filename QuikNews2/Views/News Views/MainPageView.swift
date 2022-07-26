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
    @State var index: Int = 0
    
    var body: some View {
        
        
        ZStack{
            
            
            
            ModelPages(viewModel.articles ,currentPage: $index, navigationOrientation: .vertical,
                       hasControl: false) { pageIndex, objs in
                
                
                NewsDetailView(obj: viewModel.articles[pageIndex])
                
            }
            
            
            
        }
        .ignoresSafeArea()
        .onAppear(){
            
            self.viewModel.fetchNews()
            
        }
    }
}

