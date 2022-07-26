//
//  LoginForm.swift
//  QuikNews2
//
//  Created by Wafi Choudhury on 6/5/22.
//

import SwiftUI
import FirebaseAuth

struct LoginForm: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @Binding var formShowing: Bool
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                Form{
                    
                
                    Section{
                        TextField("Email", text: $email)
                        SecureField("Password", text: $password)
                        
                    }
                    
                    if(errorMessage != nil){
                        Section{
                            
                            Text(errorMessage!)
                        }
                    }
                    
                    Section{
                        
                        ZStack{
                            
                            Color.indigo
                            Button {
                                //do login
                                signIn()
                                
                            } label: {
                                
                                Text("Sign In").foregroundColor(.white).bold()
                                    .padding()
                                    
                                
                            }
                        }
                    }

                }.navigationBarTitle("Welcome Back!👋")
                
            }
            
        }
        
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


