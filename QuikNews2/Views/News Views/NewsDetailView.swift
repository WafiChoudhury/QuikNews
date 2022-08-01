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
                        
                        ZStack{
                            
                            Rectangle()
                                .fill(Color(.gray))
                                .aspectRatio(contentMode: .fit)
                                .frame(width:geometry.size.width,height:450)
                            
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .layoutPriority(-1) // special sauce
                            
                            
                        }
                        .clipped()
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
                            .lineLimit(5)
                            .font(.system(size: 28))
                            .font(Font.custom("Helvetica Condensed Regular.ttf", size: 24))
                            .padding(.top, 12)
                            .padding(.leading, 10)
                        
                        HStack{
                            
                            Text(obj.source)
                                .font(Font.custom("Helvetica Condensed Regular.ttf", size: 18))
                                .italic()
                                .padding(.top, 1)
                                .foregroundColor(.black).opacity(20)
                                .padding(.bottom, 1)
                                .padding(.leading, 10)
                            
                            
                        }
                        
                        
                    }
                    
                    
                    Text(obj.body)
                        .bold()
                        .font(Font.custom("Helvetica Condensed Regular.ttf", size: 18))
                        .padding(.bottom, 80)
                        .padding(.top, 10)
                        .padding([.leading, .trailing], 10)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                .padding()
                .lineSpacing(5)
                
                
            }
            
            
            Spacer()
        }
        
        
    }
    func actionSheet() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
}

