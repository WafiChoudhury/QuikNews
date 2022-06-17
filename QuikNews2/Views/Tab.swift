//
//  TabView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/15/22.
//

import SwiftUI

struct Tab: View {
    
    @Binding var loggedIn: Bool
    @ObservedObject private var viewModel = NewsViewModel()
    
    var body: some View {
        
        
        
        TabView{
            
            
            
            
            TrendingTab()
                .environmentObject(NewsViewModel())
                .tabItem {
                    Label("Trending", systemImage: "chart.line.uptrend.xyaxis").foregroundColor(.white)
                }
            
            MainPageView()
                .environmentObject(NewsViewModel())
                .tabItem {
                    Label("Home", systemImage: "house.fill").foregroundColor(.white)
                }
            
            Settings(loggedIn: $loggedIn)
                .environmentObject(NewsViewModel())
                .tabItem {
                    Label("Settings", systemImage: "gearshape").foregroundColor(.white)
                }
            
            
            
            
        }
        
        //home page similar to FYP
  
        
        
        
    }
}

