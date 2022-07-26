//
//  TrendingBlock.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/23/22.
//

import SwiftUI

struct TrendingBlock: View {
    
    var trendingStory: TrendingModel

    var body: some View {
        
        HStack (alignment:.top){
            
            Text("1").font(.largeTitle).foregroundColor(.black).bold()
            Spacer()
            let uiImage = trendingStory.image
            Image(uiImage)
                .resizable()
                .frame(width: 100, height:100)
                .cornerRadius(5)
                .scaledToFit()
            Spacer()
            VStack(alignment:.leading){
                Text(trendingStory.category ?? "").foregroundColor(.gray)
                Text(trendingStory.title).bold().foregroundColor(.black)
            }
            Spacer()
        }
    }
}

