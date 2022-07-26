//
//  LaunchView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 5/29/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseAuthUI


struct LaunchView: View {
    
    @State var loggedIn = false
    @State var loginIsShowing = false
    @State var createFormShowing = false
    
    init(){
        
        FirebaseApp.configure()
    }
    
    
    var body: some View {
        
        //check loggedIn property and
        //show appropriate view
        
        if(!loggedIn){
            
            ZStack{
                
                Color.indigo
                

                VStack(spacing:20){
                    
                    Spacer()
                    Text("QuikNews").foregroundColor(.white).font(.largeTitle).bold()
                    
                    
                    Button {
                        createFormShowing = true
                    } label: {
                        
                        Text("Create Account").foregroundColor(.white).bold()
                    }.sheet(isPresented: $createFormShowing, onDismiss: checkLoginState) {
                        CreateAccount(formShowing: $createFormShowing)
                    }
                    
                    
                    Button {
                        
                        //enable login form
                        loginIsShowing = true
                        
                    } label: {
                        
                        Text("Sign In").foregroundColor(.white).bold()
                    }.sheet(isPresented: $loginIsShowing, onDismiss: checkLoginState){
                        TestView(formShowing: $loginIsShowing)
                    }
                    Spacer()
                }
            }.ignoresSafeArea()
                .onAppear(){
                    
                    checkLoginState()
                }
        }
        else{
            
            Tab(loggedIn: $loggedIn)
        }
    }
    
    func checkLoginState(){
        
        loggedIn =  Auth.auth().currentUser == nil ? false : true
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
