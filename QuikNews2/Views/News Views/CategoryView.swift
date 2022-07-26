//
//  CategoryView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/14/22.
//

import SwiftUI

struct CategoryView: View {
    
    let title:String
    
    var body: some View {
        
        
        
        let wid = 150.0
        let heigh = 80.0
        
        ZStack(alignment:.leading){
            
            Rectangle()
                .frame(width: wid, height: heigh)
                .cornerRadius(10)
                .foregroundColor(.newPrimaryColor)
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .padding()
        }
        
    }
    
    
}

extension Color {
    static let newPrimaryColor = Color("tabColor")
}
