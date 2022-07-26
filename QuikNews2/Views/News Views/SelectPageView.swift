//
//  MainPageView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 5/27/22.
//

import Pages
import SwiftUI

struct SelectPageView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    @State var index: Int = 0
    @State var categoryChosen: String
    var filteredArr = [NewsObject]()
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    
    
    var body: some View {
        
        
        ZStack{
            
            ZStack{
                
                let filtered = viewModel.articles.filter { NewsObject in
                    
                    NewsObject.category == categoryChosen
                }
                
                ModelPages(filtered ,currentPage: $index, navigationOrientation: .vertical,
                           hasControl: false) { pageIndex, objs in
                                        
                    SelectDetailView(obj: filtered[pageIndex], mode:mode)
                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
            }
            .ignoresSafeArea()
        } .onAppear(){
            
            self.viewModel.fetchNews()
            
        }
    }
}

