//
//  ResetPasswordView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 7/24/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseAuthUI

struct ResetPasswordView: View {
    
    @State var email: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 40){
            
            Text("Forgot Password").font(.title).bold()
            Text("Enter your email to reset your password.")
                .font(.subheadline)
                .lineLimit(4)
                .foregroundColor(.gray)
            
            TextField("Email", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .frame(width: 300)
                .autocapitalization(.none)
                .padding(.bottom, 20)
            
            
            Button {
                resetPassword()
                
            } label: {
                Text("Reset Password")
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
    
    
    func resetPassword(){
        
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                  DispatchQueue.main.async {
                      //hide loader


                      if let error = error {
                          //show alert here
                          print(error.localizedDescription)
                      }
                      else {
                          //show alert here
                          print("We send you an email with instructions on how to reset your password.")
                      }
                  }
              }
    }
}
struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
