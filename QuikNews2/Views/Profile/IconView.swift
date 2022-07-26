//
//  IconView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/8/22.
//

import SwiftUI
import FirebaseAuth

struct IconView: View {
    var body: some View {
        
        VStack(alignment:.leading, spacing:20){
            
            
            Text("Profile")
                .font(.system(size: 24, weight: .bold, design: .rounded))
            
            HStack{
                
                Image("img")
                    .resizable()
                    .frame(width:100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle().stroke(Color.black, lineWidth: 5))
                
                VStack(alignment:.leading, spacing:10){
                    
                    Text(Auth.auth().currentUser?.displayName ?? "User")
                        .bold()
                        .lineLimit(3)
                    Text(Auth.auth().currentUser?.email ?? "User Email")
                        .lineLimit(10)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}
