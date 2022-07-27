//
//  MainPageView.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 5/27/22.
//

import SwiftUI
import FirebaseAuth
struct exper: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    @Binding var loggedIn: Bool
    
    var body: some View {
        
        NavigationView{
            
            ScrollView{
                
                VStack(spacing:80){
                    
                    Group {
                        
                        Spacer()
                        IconView()
                            .padding(.trailing, 60)
                        
                        Button(action: {
                        }) {
                            
                            HStack(){
                                
                                NavigationLink(destination:ChangePasswordView()){
                                    Text("Change Password")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold, design: .rounded))
                                        .padding(.leading, 60)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.forward")
                                        .padding(.trailing, 70)
                                    
                                }
                            }
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(Color(UIColor.lightGray).opacity(0.3))
                            .frame(width: 320, height: 50)
                            .padding()
                       )
                        
                        
                        
                        SFSafariViewWrapper()
                      
                        SFSafariViewWrapper2()
                        
                        Button(action: {
                            try! Auth.auth().signOut()
                            loggedIn = false
                        }) {
                            
                            HStack(){
                                Text("Sign Out")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .padding(.leading, 60)
                                
                                Spacer()
                                
                                Image(systemName: "arrow.forward.square")
                                    .padding(.trailing, 70)
                                
                                
                            }
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(Color(UIColor.lightGray).opacity(0.3))
                            .frame(width: 320, height: 50)
                            .padding())
                        
                        
                        
                        Spacer()
                        
                        
                        
                    }
                }
            }
            
        }
    }
    
}
    
    

    
