//
//  TestView.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 6/5/22.
//

import SwiftUI
import FirebaseAuth
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct TestView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @Binding var formShowing: Bool

    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30){
            
            Text("Welcome Back! 👋").font(.title).bold()
            Text("Continue where you left off by logging in")
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
                signIn()
                
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(Color.white).bold()
                    .padding()
                    .frame(width: 300, height: 60)
                    .background(Color.indigo)
                    .cornerRadius(15.0)
            }
            
        }.padding()
        
    }
    
    func signIn(){
        
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            
            DispatchQueue.main.async {
                
                if( error == nil){
                    
                    formShowing = false
                }
                else{
                    //issue with login
                    
                    errorMessage = error?.localizedDescription
                    
                }
            }
        }
        
    }
}

