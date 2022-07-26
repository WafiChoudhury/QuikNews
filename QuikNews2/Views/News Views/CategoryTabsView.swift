//
//  CategoryTabsView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/16/22.
//

import SwiftUI



struct CategoryTabsView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    var filteredArr = [NewsObject]()
    
    
    
    var body: some View {
        
        
        
        
        NavigationView{
            
            Group{
                
                
                HStack(spacing:40){
                    
                    VStack(spacing:40){
                        Spacer()
                        NavigationLink(destination: SelectPageView(categoryChosen:"Economy")) {
                            
                            CategoryView(title: "📈 Markets")
                        }
                        NavigationLink(destination: SelectPageView(categoryChosen:"Politics")) {
                            
                            CategoryView(title: "👩‍⚖️ Politics")
                        }
                        NavigationLink(destination: SelectPageView(categoryChosen:"Real Estate")) {
                            
                            CategoryView(title: "🏠 Real Estate")
                        }
                        NavigationLink(destination: SelectPageView(categoryChosen:"Tech")) {
                            
                            CategoryView(title: "💻 Tech")
                        }
                        
                        NavigationLink(destination: SelectPageView(categoryChosen:"Opinion")) {
                            
                            CategoryView(title: "🤔 Opinion")
                        }
                        
                        Spacer()
                    }
                    VStack(spacing:40){
                        Spacer()
                        NavigationLink(destination: SelectPageView(categoryChosen:"Headlines")) {
                            
                            CategoryView(title: "👀 Headlines")
                        }
                        NavigationLink(destination: SelectPageView(categoryChosen:"Global")) {
                            
                            CategoryView(title: "🌎 Global")
                        }
                        NavigationLink(destination: SelectPageView(categoryChosen:"Crypto")) {
                            
                            CategoryView(title: "🔮 Crypto")
                        }
                        NavigationLink(destination: SelectPageView(categoryChosen:"Investigations")) {
                            
                            
                            let wid = 150.0
                            let heigh = 80.0
                            
                            ZStack(alignment:.leading){
                                
                                Rectangle()
                                    .frame(width: wid, height: heigh)
                                    .cornerRadius(10)
                                    .foregroundColor(.newPrimaryColor)
                                VStack(alignment:.center){
                                Text("🎤 Pop")
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.black)
                                    
                                Text("Culture")
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(.black)
                                        .padding(.leading, 20)
                                    
                                }
                            }
                            
                        }
                        NavigationLink(destination: SelectPageView(categoryChosen:"Arts")) {
                            
                            CategoryView(title: "🎨 Arts")
                        }
                        Spacer()
                    }
                }.padding()
            }
            .padding(.bottom, 90)
            .navigationTitle("Categories")
            
        }
        .onAppear(){
        }
        .navigationBarHidden(false)
    }
    
    
}



struct CategoryTabsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTabsView()
    }
}
