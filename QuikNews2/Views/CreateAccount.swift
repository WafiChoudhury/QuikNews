//
//  CreateAccount.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 6/5/22.
//

import SwiftUI
import FirebaseAuth
struct CreateAccount: View {
    
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var errorMessage: String?
    @Binding var formShowing: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30){
            
            Text("Welcome to QuikNews 👋").font(.title).bold()
            Text("You can start using the application after sign up.")
                .font(.subheadline)
                .lineLimit(4)
                .foregroundColor(.gray)
            
            TextField("Email", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .frame(width: 300)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .frame(width: 300)
                .padding(.bottom, 20)
            
            if(errorMessage != nil){
                Section{
                    
                    Text(errorMessage!)
                }
            }
            Button {
                createAccount()
                
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(Color.white).bold()
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.indigo)
                    .cornerRadius(15.0)
            }
            
        }.padding()
        
        
    }
    
    func createAccount(){
        
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            
            DispatchQueue.main.async {
                if(error == nil){
                    
                    formShowing = false
                }
                else{
                    
                    errorMessage = error?.localizedDescription
                }
            }
        }
        
        
    }
}

