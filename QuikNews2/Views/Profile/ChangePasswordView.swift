//
//  ResetPasswordView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/24/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseAuthUI

struct ChangePasswordView: View {
    
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 40){
            
            Text("Change Password").font(.title).bold()
            Text("Enter your new password.")
                .font(.subheadline)
                .lineLimit(4)
                .foregroundColor(.gray)
            
            TextField("New Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .frame(width: 300)
                .autocapitalization(.none)
                .padding(.bottom, 20)
            
            
            Button {
                changePassword()
                
            } label: {
                Text("Update Password")
                    .font(.headline)
                    .foregroundColor(Color.white).bold()
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.indigo)
                    .cornerRadius(15.0)
            }
            
        }.padding()
            .padding(.bottom, 200)
    }
    
    
    func changePassword(){
    
        
        let user = Auth.auth().currentUser
        var credential: AuthCredential

        // Prompt the user to re-provide their sign-in credentials
        Auth.auth().currentUser?.updatePassword(to: password) { (error) in
          // ...
            print(error)
        }

    }
}
