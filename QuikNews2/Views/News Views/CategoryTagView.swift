//
//  CategoryTagView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 6/25/22.
//

import SwiftUI

struct CategoryTagView: View {
    
    var obj:NewsObject
    
    var body: some View {
        
        ZStack{

            
                Capsule()
                    .fill(.indigo)
                    .frame(width:80, height: 32)
                    .padding(.bottom, 10)
                
            Text("#" + obj.category)
                .font(.system(size:15))
                .bold()
                .foregroundColor(.gray)
                .padding(.bottom, 12)
            
        }
        
    }
}
