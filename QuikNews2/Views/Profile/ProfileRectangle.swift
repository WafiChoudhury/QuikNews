//
//  ProfileRectangle.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/4/22.
//

import SwiftUI

struct ProfileRectangle: View {
    
    
    var title: String
    @State var on = true
    var body: some View {
        
       
        Button(action: { }) {
            
            HStack(){
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .padding(.leading, 60)
                Spacer()
                

                }
            
        }
        .background(RoundedRectangle(cornerRadius: 10.0)
            .foregroundColor(Color(UIColor.lightGray).opacity(0.3))
            .frame(width: 320, height: 50)
            .padding())
         
         
    }
    
}
