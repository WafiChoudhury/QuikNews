//
//  TrendingList.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/23/22.
//

import SwiftUI

struct TrendingList: View {
    
    @EnvironmentObject var model: ContentModel

    var body: some View {
        NavigationView{
        ScrollView (showsIndicators: false){

            LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]){

                ForEach(model.trending) { trendingStory in
                    
                    NavigationLink {
                        
                       //NewsDetailView()

                    } label: {
                        TrendingBlock(trendingStory: trendingStory)
                    }

                }
                
            }.padding()
        
            }.navigationBarTitle("Trending")
        
        }


        
        
    }
}

