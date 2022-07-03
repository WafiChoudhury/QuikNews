//
//  NewsDetailView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/12/22.
//

import SwiftUI

struct NewsDetailView: View {
    
    @State var isPlaying : Bool = false
    var obj: NewsObject
    
    var body: some View {
        
        
        VStack (alignment: .leading){
            
            ZStack(alignment: .leading){
                
                GeometryReader(content: { geometry in
                    
                    AsyncImage(url: URL(string: obj.image)) { image in
                        image.resizable()
                        //image.ignoresSafeArea()
                    } placeholder: {
                        Color.gray
                    }
                   // .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                })
                .ignoresSafeArea(edges: .top)
                
                HStack{
                    Spacer()
                    VStack{
                        Button {
                            actionSheet()
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right").frame(width:50, height: 50)
                        }.foregroundColor(.white)
                        Button {
                            isPlaying.toggle()
                            
                        } label: {
                            Image(systemName: self.isPlaying  == false ? "bookmark": "bookmark.fill")
                        }.foregroundColor(.white)
                    }
                    .frame( height: 20, alignment: .topTrailing)
                    .padding(.bottom, 200)
                    
                }
                
                
                
            }
            
            Spacer()
            ScrollView(.vertical){
                
                
                
                VStack(alignment: .leading){
                    
                    Section
                    {
                        Text(obj.title)
                            .bold()
                            .font(.system(size: 20))
                            .font(Font.custom("Roboto-Bold", size: 20))
                            .padding(.bottom, 5)
                        
                        HStack{
                            
                            Text("Source: " + obj.source)
                                .bold()
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .padding(.bottom, 10)
                            
                            Spacer()
                            CategoryTagView(obj: obj)
                            Spacer()
                            
                        }
                        
                        
                    }
                    
                    
                    Text(obj.body)
                        .bold()
                        .font(Font.custom("Roboto-Regular.ttf", size: 15))
                        .lineSpacing(15)
                    
                    
                }.padding()
                
            }
            
            
            
        }
        
        
    }
    func actionSheet() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
}

