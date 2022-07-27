//
//  SFSafariViewWrapper.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/26/22.
//


import SwiftUI
import SafariServices

struct SFSafariViewWrapper2: View {
    @State private var showSafari: Bool = false
    
    var body: some View {
        
        
        Button(action: {
            showSafari.toggle()

        }) {
            
            HStack(){
                Text("Privacy")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .padding(.leading, 60)
                
                Spacer()
                
                Image(systemName: "chevron.forward")
                    .padding(.trailing, 70)
                
                
            }
            
        }
        .background(RoundedRectangle(cornerRadius: 10.0)
            .foregroundColor(Color(UIColor.lightGray).opacity(0.3))
            .frame(width: 320, height: 50)
            .padding())
        
        
        .fullScreenCover(isPresented: $showSafari, content: {
            SFSafariViewWrapper2(url: URL(string: "https://www.termsfeed.com/live/81af5203-309b-4bf2-9c71-ebb39615e061")!)
        })
    }
    
    struct SFSafariViewWrapper2: UIViewControllerRepresentable {
        let url: URL
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }
        
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper2>) {
            return
        }
    }
}

