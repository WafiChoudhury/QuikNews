//
//  SFSafariViewWrapper.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/26/22.
//


import SwiftUI
import SafariServices

struct SFSafariViewWrapper: View {
    @State private var showSafari: Bool = false
    
    var body: some View {
        
        
        Button(action: {
            showSafari.toggle()
        }) {
            
            HStack(){
                Text("Terms and Conditions")
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
            SFSafariViewWrapper(url: URL(string: "https://www.termsfeed.com/live/e0204fa3-a7fd-46ae-a40d-7400ae74d607")!)
        })
    }
    
    struct SFSafariViewWrapper: UIViewControllerRepresentable {
        let url: URL
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }
        
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
            return
        }
    }
}


struct SFSafariViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        SFSafariViewWrapper()
    }
}
