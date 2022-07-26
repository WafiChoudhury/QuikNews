//
//  TabView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/15/22.
//

import SwiftUI
import FirebaseAuthUI
import FirebaseAuth

struct Tab: View {
    
    @Binding var loggedIn: Bool
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    @ObservedObject private var viewModel = NewsViewModel()
    
    var body: some View {
        
        CustomTabContainerView(selection: $tabSelection) {
            
          
            MainPageView()
                .environmentObject(viewModel)
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            CategoryTabsView()
                .environmentObject(viewModel)
                .tabBarItem(tab: .favorites, selection: $tabSelection)
            
            Settings(loggedIn: $loggedIn)
                .environmentObject(viewModel)
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
        
        }

    }
    
 
    
}
extension Tab{
    
    private var defaultTabView : some View {
        
        TabView(selection: $selection){
              
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
    }
    
}
